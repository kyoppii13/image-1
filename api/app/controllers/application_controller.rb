class ApplicationController < ActionController::API
  def current_user
    @current_user ||=
      if session[:user_id]
        User.find_by(id: session[:user_id])
      else
        validate_jwt
      end
  end

  def validate_jwt
    return if @current_user

    jwt_token = request.headers['Authorization']
    email =
      Utils::JwtValidator.new(jwt_token).validate!['email']
    Rails.logger.log 'aaaaaaaaaaaaaaa'
    Rails.logger.log jwt_token
    rescue StandardError => e
      Rails.logger.error e.message

    user = User.find_by(email: email)
    unless user.present?
      user = User.create!(email: email)
    end
    session[:user_id] = user.id
    @current_user = user
  end

end
