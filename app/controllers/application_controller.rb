class ApplicationController < ActionController::API
  before_action :authenticate_user, except: [:login, :signup]

  def authenticate_user
    binding.pry
    token = params["token"]
    jst = JsonWebToken.decode(token) 
    @current_user = User.find(jst["id"])
  end

end
