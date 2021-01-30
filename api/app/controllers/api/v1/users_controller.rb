class Api::V1::UsersController < ApplicationController
  def index
    users = User.find_by(uid: user_params[:uid])
    render json: users
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 200
    else
      render json: user.errors, status: 400
    end
  end

  def test
    render json: {hello: 'hello world'}
  end

  private
  def user_params
    params.require(:user).permit(:uid)
  end
end
