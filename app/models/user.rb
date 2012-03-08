class User < ActiveRecord::Base
  # twitter_id:integer
  # username
  # name
  # image
  # auth_token
  # auth_secret
  # email
  
  # attr_accessible :email, :name
  
  has_many :tweets
  
  def tweet(message)
    Twitter::Client.new(
      oauth_token:        auth_token,
      oauth_token_secret: auth_secret
    ).update(message)
  end
end
