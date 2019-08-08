class Api::V1::ContactAddressController < Api::V1::ContactsController
  def show
    @address = @contact.address
    render json: @address, status: :ok
  end
end