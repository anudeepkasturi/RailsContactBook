class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  def index
    @contacts = Contact
                .joins(:contact_shares)
                .where("contacts.user_id = ? OR contact_shares.user_id = ?", params[:user_id], params[:user_id])

    render json: @contacts
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: @contact
  end

  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    render json: @contact.destroy
  end

  def favorites
    @contacts = Contact.where("favorited = true AND user_id = ?", params[:user_id])
    render json: @contacts
  end

  def groups
    @contact_groups = ContactGroup.where("contact_groups.user_id = ?", params[:user_id])
    render text: @contact_groups.to_json(include: :contacts)
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id, :favorited)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
