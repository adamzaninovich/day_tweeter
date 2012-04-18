# Publishes Tweets both manually and automatically

class TweetPublisher
  @queue = :tweet_queue
  
  def self.perform(tweet_id)
    begin
      tweet = Tweet.unpublished.where(id: tweet_id).first
      unless tweet
        puts 'No tweet to tweet. Exiting...'
        return
      end
      user = tweet.user
      puts "#{Time.now.strftime('%Y-%m-%d %H:%M:%S')} publishing tweet for @#{user.username}"
      client = Twitter::Client.new(oauth_token:user.auth_token, oauth_token_secret:user.auth_secret)
      client.update(tweet.body)
      tweet.pending = false
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