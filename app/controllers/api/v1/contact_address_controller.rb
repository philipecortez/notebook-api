class Api::V1::ContactAddressController < ApplicationController
  before_action :set_contact

  def destroy
    @contact.address.destroy
    render :nothing, status: :no_content
  end

  def create
    @contact.address = Address.new(address_params)

    if @contact.save
      render json: @contact.address, status: :created, location: api_v1_contact_address_url(@contact)
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def update
    if @contact.address.update(contact_params)
      render json: @contact.address, status: :ok
    else
      render json: @contact.address.errors, status: :unprocessable_entity
    end
  end

  def show
    @address = @contact.address
    render json: @address, status: :ok
  end

  private

  def set_contact
    @contact = Contact.find(params[:contact_id])
  end

  def address_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
  
end