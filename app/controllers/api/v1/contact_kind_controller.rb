class Api::V1::ContactKindController < ApplicationController
  def show
    @kind = Contact.find(params[:contact_id]).kind
    render json: @kind, status: :ok
  end
end