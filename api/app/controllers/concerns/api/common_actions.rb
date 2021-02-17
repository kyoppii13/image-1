module Api::CommonActions
  extend ActiveSupport::Concern
  def render_bad_request(message: 'BAD_REQUEST', display_message: nil, details: nil)
    render_error(code: 400, message: message, display_message: display_message, details: details)
  end

  def render_unauthorized(message: 'UNAUTHORIZED', display_message: nil, details: nil)
    render_error(code: 401, message: message, display_message: display_message, details: details)
  end

  def render_not_found(message: 'NOT_FOUND', display_message: nil, detail: nil)
    render_error(code: 404, message: message, display_message: display_message, details: detail)
  end

  def render_error(code:, message:, display_message: nil, details: nil)
    res = {
      message: message,
      display_message: display_message,
      details: details
    }

    render json: res, status: code
  end
end
