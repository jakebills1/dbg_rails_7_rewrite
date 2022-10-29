class Api::GuitarsController < ApplicationController
  # before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_guitar, only: [:destroy, :update]
  def index
    render json: Guitar.all#.to_json(:include => :pictures)
  end

  def create
    guitar = Guitar.new(guitar_params)
    if guitar.save
      render json: guitar
    else
      render json: guitar.errors
    end
  end

  def update
    if @guitar.update(guitar_params)
      render json: @guitar
    else
      render json: @guitar.errors
    end
  end

  def destroy
    @guitar.destroy 
    render json: { message: "deleted"}
  end
  
  private
    def set_guitar
      @guitar = Guitar.find(params[:id])
    end
    def guitar_params
      params.require(:guitar).permit(:name, :price, :description, :year)
    end
  
end
