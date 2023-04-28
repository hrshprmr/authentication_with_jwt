class SessionsController < ApplicationController
  before_action :token_generate
  def new
  end

  def login
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      render json: { message: 'Login successful.', token: @token}
    else
      render json: { errors: ['Invalid email or password.'] }, status: :unprocessable_entity
    end
  end
  

  def destroy
    session[:user_id] = nil
    render json: { message: 'Logout successful.' }
  end

  def token_generate
    @user = User.find_by(email: params[:email])
    @token = JsonWebToken.encode(@user.id)
  end
end
