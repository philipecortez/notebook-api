class Api::V1::ContactPhonesController < Api::V1::ContactsController
  def show
    @phones = @contact.phones
    render json: @phones, status: :ok
  end
end