class Api::V1::KindsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  def index
    @kinds = Kind.all
    render json: @kinds, status: :ok
  end

  def show
    render json: @kind, status: :ok
  end

  def create
    @kind = Kind.new(kind_params)

    if @kind.save
      render json: @kind, status: :created
    else
      render json: @kind.errors, status: :unprocessable_entity
    end
  end

  def update
    if @kind.update_attributes(kind_params)
      render json: @kind, status: :ok
    else
      render json: @kind.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @kind.destroy
    render :nothing, status: :no_content 
  end

  private

  def kind_params
    params.require(:kind).permit(:description)
  end

  def set_contact
    @kind = Kind.find(params[:id])
  end
end