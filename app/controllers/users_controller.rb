class UsersController < ApplicationController
  def new
  end

  def login
    @user = User.find_by_username(params[:username])
    @user = User.create!(user_params) unless @user
    json_response(@user)
  end

  def user_params
    # whitelist params
    params.permit(:username, :password)
  end
end
