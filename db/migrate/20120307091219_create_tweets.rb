class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.date :date
      t.text :body
      t.boolean :active
      t.boolean :published
      t.datetime :published_at

      t.timestamps
    end
    add_index :tweets, :user_id
  end
end
