class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :twitter_id
      t.string :username
      t.string :name
      t.string :image
      t.string :auth_token
      t.string :auth_secret

      t.timestamps
    end
  end
end
