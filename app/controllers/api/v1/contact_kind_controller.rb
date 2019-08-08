class Api::V1::ContactKindController < Api::V1::ContactsController
  def show
    @kind = @contact.kind
    render json: @kind, status: :ok
  end
end