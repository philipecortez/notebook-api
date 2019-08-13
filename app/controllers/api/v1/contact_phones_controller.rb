class Api::V1::ContactPhonesController < ApplicationController
  before_action :set_contact

  def destroy
    Phone.find(phone_params[:id]).destroy
    render :nothing, status: :no_content
  end

  def create
    binding.pry
    @contact.phones << Phone.new(phone_params)

    if @contact.save
      render json: @contact.phones, status: :created, location: api_v1_contact_phones_url(@contact)
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def update
    phone = Phone.find(phone_params[:id])
    if phone.update(phone_params)
      render json: @contact.phones, status: :ok
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end


  def show
    @phones = @contact.phones
    render json: @phones, status: :ok
  end

  private

  def set_contact
    @contact = Contact.find(params[:contact_id])
  end

  def phone_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
  
end