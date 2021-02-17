class AwsS3Client
  def initialize
    @client ||=  Aws::S3::Client.new(
      region: 'ap-northeast-1',
      access_key_id: ENV['ACCESS_KEY_ID'],
      secret_access_key: ENV['SECRET_ACCESS_KEY']
    )
  end

  def upload(bucket:, body:, key:)
    @client.put_object(bucket: bucket, body: body, key: key)
  end

  def getAllImages(bucket:, prefix:)
    @client.list_objects(bucket: bucket, prefix: prefix)[:contents].map { |content|
      next unless content.key.match(/.*\.(jpg|jpeg|png)$/)
      {
        url: content.key,
        last_modified: content.last_modified
      }
    }.compact
  end
end
