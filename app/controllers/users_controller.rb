class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def signup
    @user = User.new(user_params)
    if @user.save
      render json: { message: 'User created successfully.' }
    else
      render json: { errors: @user.errors.full_messages }, status:
       :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
