class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render json: @contacts
  end

  def create
    contact1 = Contact.new(contact_params)
    if contact1.save
      render json: contact1
    else
      render(
        json: contact1.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    @contact = Contact.find(contact_params[:id])
    render json: @contact
  end

  def new
  end


  def update
    @contact = Contact.find(contact_params[:id])
    if @contact.update(contact_params)
      render json: @contact
    else
      render( json: @contact.errors.full_messages, status: :unprocessable_entity
    )
    end
  end

  def edit
  end

  def destroy
    @contact = Contact.find(contact_params[:id])
    @contact.destroy
    render json: @contact
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end

end
