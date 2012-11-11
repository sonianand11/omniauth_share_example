class User < ActiveRecord::Base
  attr_accessible :email, :image_url, :name, :oauth_expire_at, :oauth_token, :provider, :uid,:secret_token

  validates :uid , :uniqueness => true

  def tweet(message)
    Twitter.configure do |config|
      config.consumer_key = "ilo5D6B1EAiVJYno2iJfQ"
      config.consumer_secret = "RKEQ0BVuB1h5ht9uC0TRzps8MunvPYJPehsqWPiZs"
      config.oauth_token = self.oauth_token
      config.oauth_token_secret = self.secret_token
    end

    client = Twitter::Client.new
    client.update(message)

  end

end
