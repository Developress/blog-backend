class UsersController < ApplicationController
  def new
  end

  def login
    @user = User.find_by_username(params[:username])
    unless @user.authenticate(params[:password])
      json_response({ "message": "wrong password" })
      return
    end
    @user = User.create!(user_params) unless @user
    json_response(@user)
  end

  def user_params
    # whitelist params
    params.permit(:username, :password)
  end
end
