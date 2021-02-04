class Api::V1::QuestionsController < ApplicationController
  def create
    Question.create(image_url: question_params[:image_url], user: User.first)
    render  head: :ok
  end

  private
  def question_params
    params.require(:question)
    .permit(
      :image_url,
      :delete_flag,
      :adult_flag
    )
  end
end
