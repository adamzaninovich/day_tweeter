class Tweet < ActiveRecord::Base
  belongs_to :user
  
  scope :unpublished, where(published:false)
  scope :published, where(published:true)
  
  def enable!
    self.active = true
    self.save!
  end
  
  def disable!
    self.active = false
    self.save!
  end
  
  def publish!
    begin
      client = Twitter::Client.new(oauth_token:user.auth_token, oauth_token_secret:user.auth_secret)
      tweet = client.update(body)
      self.published = true
      self.published_at = Time.now
      self.save!
      return tweet
    rescue Twitter::Error::Unauthorized => e
      self.published = false
      self.published_at = nil
      self.save!
      return false
    end
  end
    
end
