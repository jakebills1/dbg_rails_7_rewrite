class GuitarsController < ApplicationController
  # before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_guitar, only: [:show, :destroy, :update]
  before_action :set_guitars, only: :index
  def index
    respond_to do |format|
      format.html
      format.json { render json: @guitars }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @guitar }
    end
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
    def set_guitars
      @guitars = Guitar.all
    end
    def guitar_params
      params.require(:guitar).permit(:name, :price, :description, :year)
    end
end
