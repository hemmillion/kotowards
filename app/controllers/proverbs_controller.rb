class ProverbsController < ApplicationController
  
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @proverbs = Proverb.includes(:user, :comments).page(params[:page]).per(10).order("average DESC")
  end
  
  def new
  end
  
  def create
    Proverb.create(text: proverb_params[:text], user_id: current_user.id)
  end

  def destroy
    proverb = Proverb.find(params[:id])
    proverb.destroy if proverb.user_id == current_user.id
  end

  def edit
    @proverb = Proverb.find(params[:id])
  end

  def update
    proverb = Proverb.find(params[:id])
    proverb.update(proverb_params) if proverb.user_id == current_user.id
  end

  def show
    @proverb = Proverb.find(params[:id])
    @comments = @proverb.comments.includes(:user)
    @comment = Comment.new
  end

  def search
    @proverbs = Proverb.where('text LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(10).order("created_at DESC")
  end
  
  private
  def proverb_params
    params.permit(:text)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
