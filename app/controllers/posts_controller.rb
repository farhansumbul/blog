class PostsController < ApplicationController

  before_filter :load_post, :only => [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to @post, :notice => 'Post was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to @post, :notice => 'Post was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to :back
  end
  
  private

  def load_post
    @post = Post.find(params[:id])
  end
end
