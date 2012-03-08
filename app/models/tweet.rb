class Tweet < ActiveRecord::Base
  belongs_to :user
  
  scope :unpublished, where(published:false)
  scope :published, where(published:true)
end
