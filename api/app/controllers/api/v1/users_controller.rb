class Api::V1::UsersController < ApplicationController
  before_action :validate_jwt

  def index
    users = current_user
    render json: users
  end


  def test
    render json: {hello: 'hello world'}
  end

  private
  def user_params
    params.require(:user)
  end
end
