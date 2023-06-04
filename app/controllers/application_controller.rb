class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :store_user_location, if: :storable_location?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  private

  def store_user_location
    # Store the current URL as the user's return location
    session[:return_to] = request.referer
  end

  def storable_location?
    # Only store the URL if it's a GET request
    request.get?
  end

  def after_sign_in_path_for(resource_or_scope)
    # If the user has a stored return location, redirect to that page
    if session[:return_to].present?
      session[:return_to]
    else
      # Otherwise, redirect to the default path after login
      super
    end
  end



  def default_url_options
    {locale: I18n.locale}
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ?
      parsed_locale.to_sym :
      nil
  end
end
