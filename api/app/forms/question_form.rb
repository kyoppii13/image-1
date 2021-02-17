class QuestionForm
  include ActiveModel::Model

  attr_accessor :question, :user, :image, :filename, :error

  validates! :user, :image, :filename, presence: true

  # def initialize(question:, user:, image:, filename:)
  #   @user = user
  #   @image = image
  #   @filename = filename
  # end

  def save
    persist! do
      question.user = user
      question.image_url = question.upload(image: image, filename: filename)
      question.save!
    end
  end

  def persist!
    valid?
    yield
    true
  rescue ActiveRecord::RecordInvalid => e
    @error = {
      display_message: 'バリデーションに失敗しました',
      details: e.record.errors.full_messages
    }
    error
  end
end
