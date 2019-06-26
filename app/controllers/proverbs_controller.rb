class ProverbsController < ApplicationController
  def index
    @proverbs = Proverb.all
  end
  
  def new
  end
  
  def create
    Proverb.create(proverb_params)
  end

  private
  def proverb_params
    params.permit(:text)
  end
end
