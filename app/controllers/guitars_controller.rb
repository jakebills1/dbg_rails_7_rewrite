class GuitarsController < ApplicationController
  # before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_guitar, only: [:show, :destroy, :update, :edit]
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

  def new
    # doesn't need json
    @guitar = Guitar.new
  end

  def create
    @guitar = Guitar.new(guitar_params)
    respond_to do |format|
      if @guitar.save
        format.html { redirect_to @guitar }
        format.json { render json: @guitar}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @guitar.errors }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @guitar.update(guitar_params)
        format.html { redirect_to @guitar, notice: "Guitar updated!" }
        format.json { render json: @guitar }
      else
        format.html { render :edit }
        format.json { render json: @guitar.errors }
      end
    end
  end

  def destroy
    @guitar.destroy 
    respond_to do |format|
      format.html { redirect_to guitars_url, notice: "Guitar deleted!" }
      format.json { render json: { message: "deleted"} }
    end
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
