module CommonActions
  extend ActiveSupport::Concern
  def render_error(code:, message:, display_message: nil, detail: nil)
    res = {
      message: message,
      display_message: display_message,
      detail: detail
    }

    render json: res, status: code
  end
end
