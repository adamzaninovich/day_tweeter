# Publishes Tweets both manually and automatically

class TweetPublisher
  @queue = :tweet_queue
  
  def self.perform(tweet_id)
    begin
      tweet = Tweet.find(tweet_id)
      user = tweet.user
      client = Twitter::Client.new(oauth_token:user.auth_token, oauth_token_secret:user.auth_secret)
      client.update(tweet.body)
      tweet.published = true
      tweet.published_at = Time.now
      tweet.save!
    rescue Twitter::Error::Unauthorized => e
      tweet.published = false
      tweet.published_at = nil
      tweet.save!
    end
  end
  
end