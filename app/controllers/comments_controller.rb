class CommentsController < ApplicationController
  before_filter :login_required
  respond_to :html, :xml

  def new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.is_minimum_length? && @comment.save
      redirect_to user_post_path(current_user,@post), :notice => "Comment has been created."
    else
      render 'new', :notice => "Comment has not been created."
    end
  end

end

