class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
      # Render a 500 to demonstrate how the front-end handles server side errors
      if params[:id] == "this-will-trigger-an-error"
        render json: {success: false}, status: 500
      else
        @post = Post.find(params[:id])
      end

  end
end
