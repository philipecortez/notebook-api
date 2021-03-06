class Api::V1::ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  def index
    @contacts = Contact.all
    render json: @contacts, status: :ok
  end

  def show
    render json: @contact, include: [:kind, :address, :phones], status: :ok
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, include: [:kind], status: :created
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def update
    if @contact.update(contact_params)
      render json: @contact, include: [:kind], status: :ok
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @contact.destroy
    render :nothing, status: :no_content
  end

  private

  def contact_params
=begin
    params.require(:contact).permit(
      :name, :email, :birthdate, :kind_id,
      phones_attributes: [:id, :number, :_destroy],
      address_attributes: [:id, :city, :street]
    )
=end
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end