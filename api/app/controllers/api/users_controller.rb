class Api::UsersController < ApplicationController
  before_action :validate_jwt, except: :create

  def mypage
    @user = current_user

    render :template => "api/users/mypage.json.jb"
  end

  def show
    @user = User.find(params[:id])
    @contents = @user.contents
    render :user
  end

  def create
    email = get_email_Jwt
    user = User.find_by(email: email)
    unless user.present?
      user = User.create!(email: email)
    end
    render json: {user: user} ,status: 200
  end

  private
  def user_params
    params.require(:user)
  end
end
