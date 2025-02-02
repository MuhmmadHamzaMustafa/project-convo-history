class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_commentable

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @commentable, notice: 'Comment added successfully.'
    else
      redirect_to @commentable, alert: 'Error adding comment.'
    end
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy
    redirect_to @commentable, notice: 'Comment deleted successfully.'
  end

  private

  def set_commentable
    @commentable = Project.find(params[:project_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end