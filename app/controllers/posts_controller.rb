class PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: params[:post][:title], content: params[:post][:content],
                     user_id: current_user.id)

    if @post.save
      redirect_to new_post_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end
