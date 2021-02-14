class ApplicationController < ActionController::API
  include CommonActions

  class InvalidatedJwtError < StandardError; end

  rescue_from InvalidatedJwtError do |e|
    Rails.logger.error "#{e.message}"
    render_error(code: 401, message: 'unauthorized', display_message: 'unauthorized')
  end

  def current_user
    @current_user ||=
      if session[:user_id]
        User.find_by(id: session[:user_id])
      else
        validate_jwt
      end
  end

  def get_email_Jwt
    begin
      jwt_token = request.headers['Authorization']
      Rails.logger.debug jwt_token
      email = Utils::JwtValidator.new(jwt_token).validate!['email']
      Rails.logger.debug 'test3'
    rescue StandardError => e
      raise(InvalidatedJwtError, e)
    end
    email
  end

  def validate_jwt
    return if @current_user

    email = get_email_Jwt

    user = User.find_by(email: email)
    unless user.present?
      user = User.create!(email: email)
    end
    session[:user_id] = user.id
    @current_user = user
  end

end
