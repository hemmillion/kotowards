class CommentsController < ApplicationController
  def new
    @proverb = Proverb.find(params[:proverb_id])
    @comment = Comment.new
    @comments = @proverb.comments.includes(:user)
  end
  
  def create
    @comment = Comment.create(comment_params)
    comments = Proverb.find(params[:proverb_id]).comments
    average = comments.average(:rate)
    proverb = Proverb.find(params[:proverb_id])
    proverb.update(average: average)
    redirect_to "/proverbs/#{@comment.proverb.id}"
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user_id == current_user.id
    comments = Proverb.find(params[:proverb_id]).comments
    average = comments.average(:rate)
    proverb = Proverb.find(params[:proverb_id])
    proverb.update(average: average)
    redirect_to "/proverbs/#{comment.proverb.id}"
  end
  
  private
  def comment_params
    params.require(:comment).permit(:rate, :text).merge(proverb_id: params[:proverb_id], user_id: current_user.id)
  end
end
