class UsersController < ApplicationController


  def new
      @user = User.new
  end


  def create
    @user = User.create(user_params)

    if @user.errors.any?
      render json: {success: false, errors: @user.errors.messages}.to_json, status: 422
    else
      render template: '/users/new'
    end
  end

  def show
    # Render a 500 to demonstrate how the front-end handles server side errors
    if params[:id] == "this-will-trigger-an-error"
      render json: {success: false}, status: 500
    else
      @user = User.find(params[:id])
    end
  end


  private

  def user_params
    params.require(:user).permit(
                             :name,
        :email,
        :password,
        :password_confirmation
    )
  end
end
