class Api::V1::UsersController < ApplicationController
  before_action :validate_jwt

  def mypage
    @user = current_user
    render :mypage
  end

  def show
    @user = User.find(params[:id])
    @contents = @user.contents
    render :show
  end

  private
  def user_params
    params.require(:user)
  end
end
