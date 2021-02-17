class ApplicationController < ActionController::API
  include Api::CommonActions

  class InvalidatedJwtError < StandardError; end

  rescue_from InvalidatedJwtError do |e|
    render_unauthorized(details: ['認証エラー'])
  end

  rescue_from ActionController::RoutingError do |e|
    render_not_found(display_message: e.message)
  end

  def routing_error
    raise ActionController::RoutingError, params[:not_found]
  end

  def current_user
    @current_user ||=
      if session[:user_id]
        User.find_by(id: session[:user_id])
      else
        validate_jwt
      end
  end

  def get_payload_Jwt
    begin
      jwt_token = request.headers['Authorization']
      Utils::JwtValidator.new(jwt_token).validate!
    rescue StandardError => e
      raise(InvalidatedJwtError)
    end
  end

  def validate_jwt
    return if @current_user

    email = get_payload_Jwt['email']

    user = User.find_by(email: email)
    unless user.present?
      name = get_payload_Jwt['name']
      picture = get_payload_Jwt['picture']
      user = User.create!(email: email, name: name, profile_image: picture)
    end
    session[:user_id] = user.id
    @current_user = user
  end

end
