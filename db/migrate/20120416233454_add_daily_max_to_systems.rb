class AddDailyMaxToSystems < ActiveRecord::Migration
  def change
    add_column :systems, :daily_max, :integer, default: 50

  end
end
