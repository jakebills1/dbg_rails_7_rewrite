class ImagesController < ApplicationController
  layout false

  before_action :set_guitar, only: :index

  def index
  end

  private

  def set_guitar
    @guitar = Guitar.find(params[:guitar_id])
  end
end
