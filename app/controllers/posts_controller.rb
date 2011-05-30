class PostsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  respond_to :html, :xml, :only => [:index, :new, :show]
  def index
    @posts = Post.all
    # show all posts that have more than 10 comments
    @popular_posts = Post.all.collect{|p| p if p.comments.size > 10}.compact
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to user_post_path(current_user,@post), :notice => "Post has been created."
    else
      render 'new', :notice = "Post has not been created."
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

end

