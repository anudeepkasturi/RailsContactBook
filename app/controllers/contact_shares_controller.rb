class ContactSharesController < ApplicationController
  before_action :set_contact_share, only: [:show, :update, :destroy]

  def index
    @contact_shares = ContactShare.all

    render json: @contact_shares
  end

  def create
    @contact_share = ContactShare.new(contact_share_params)
    if @contact_share.save
      render json: @contact_share
    else
      render json: @contact_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: @contact_share
  end

  def update
    if @contact_share.update(contact_share_params)
      render json: @contact_share
    else
      render json: @contact_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    render json: @contact_share.destroy
  end

  private
  def contact_share_params
    params.require(:contact_share).permit(:user_id, :contact_id)
  end

  def set_contact_share
    @contact_share = ContactShare.find(params[:id])
  end
end
