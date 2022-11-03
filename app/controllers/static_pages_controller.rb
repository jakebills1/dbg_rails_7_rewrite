class StaticPagesController < ApplicationController
  def home
  end

  def contact
  end

  def gallery
    @guitars = Guitar.all
  end
end
