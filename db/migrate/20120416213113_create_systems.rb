class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.integer :user_id
      t.boolean :active,          default: true
      t.integer :start_time_hour, default: 7 # 7am
      t.integer :start_time_min,  default: 0
      t.integer :stop_time_hour,  default: 17 # 5pm
      t.integer :stop_time_min,   default: 0

      t.timestamps
    end
    add_index :systems, :user_id
  end
end
