class Api::UsersController < ApplicationController
  include Api::CommonActions
  before_action :validate_jwt

  def mypage
    @user = current_user

    render "api/users/user.json.jb"
  end

  def show
    @user = User.find(params[:id])
    @contents = @user.contents
    render :user
  end

  def create
    render json: {user: current_user} ,status: 200
  end

  private
  def user_params
    params.require(:user)
  end
end
