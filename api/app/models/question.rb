class Question < ApplicationRecord
  belongs_to :user

  validates :image_url, presence: true

  class << self
    def getAllImages(aws_client: AwsS3Client.new)
      config_s3 = Rails.configuration.x.application[:aws][:s3]
      aws_client.getAllImages(bucket: config_s3[:bucket],prefix: config_s3[:prefix]).map do |image|
        image.merge(url: File.join(config_s3[:image_domain], image[:url]))
      end
    end
  end

  def upload(aws_client: AwsS3Client.new, image:, filename:)
    config_s3 = Rails.configuration.x.application[:aws][:s3]
    saved_path = generate_filepath(config_s3[:prefix], filename)
    File.open(image.path, 'rb') do |file|
      aws_client.upload(bucket: config_s3[:bucket], body: file, key: saved_path)
    end
    image_url = File.join(config_s3[:image_domain], saved_path)
  end

  private
  def generate_filepath(prefix, filename)
    filepath = "#{Time.zone.now.strftime('%Y%m%d_%H%M%S')}_#{SecureRandom.uuid}#{File.extname(filename)}"
    File.join prefix, filepath
  end

end
