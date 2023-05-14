class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @products = Product.all
    @places = Place.all
    @markers = @places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {place: place}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end
end
