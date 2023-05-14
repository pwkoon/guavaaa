class ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params_contact)

    if @contact.save
        redirect_to  contacts_path(@contact)
    else
        render :new, status: :unprocessable_entity
    end
  end

  private

  def params_contact
    params.require(:contact).permit(:name, :email, :phone_number, :question)
  end
end
