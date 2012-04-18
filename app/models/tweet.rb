class Tweet < ActiveRecord::Base
  belongs_to :user
  
  scope :pending,     where(pending:true)
  scope :unpublished, where(published:false)
  scope :published,   where(published:true)
  
  def enable!
    self.active = true
    self.save!
  end
  
  def disable!
    self.active = false
    self.save!
  end
      
end
