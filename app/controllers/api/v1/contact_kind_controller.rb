class Api::V1::ContactKindController < ApplicationController
  before_action :set_contact, only: :show

  def show
    @kind = @contact.kind
    render json: @kind, status: :ok
  end  

  private

  def set_contact
    @contact = Contact.find(params[:contact_id])
  end
end