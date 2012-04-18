class AddPendingToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :pending, :boolean, default: false
  end
end
