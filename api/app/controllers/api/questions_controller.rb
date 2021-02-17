class Api::QuestionsController < ApplicationController
  before_action :validate_jwt
  before_action :set_question, only: [:create, :show]
  before_action :set_question_form, only: [:create]

  def index
    @questions = Question.includes(:user)
    render 'api/questions/questions.json.jb'
  end

  def create
    if @question_form.save
      render 'api/questions/question.json.jb', status: :created
    else
      render_bad_request(@question_form.error)
    end
  end

  private
  def set_question
    @question =
      if params[:id]
        Question.find(params[:id])
      else
        Question.new
      end
  end

  def set_question_form
    @question_form = QuestionForm.new(
      question: @question,
      user: current_user,
      image: params[:image].tempfile,
      filename: params[:image].original_filename
    )
  end

  def question_params
    params.require(:question)
    .permit(
      :image,
      # :delete_flag,
      # :adult_flag
    )
  end
end
