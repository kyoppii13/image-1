module Api::CommonActions
  extend ActiveSupport::Concern
  def render_bad_request(message: 'BAD_REQUEST', display_message: nil, detail: nil)
    render_error(code: 400, message: message, display_message: display_message, detail: detail)
  end

  def render_error(code:, message:, display_message: nil, detail: nil)
    res = {
      message: message,
      display_message: display_message,
      detail: detail
    }

    render json: res, status: code
  end
end
