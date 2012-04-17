class MoveTimeZomeFromUsersToSystems < ActiveRecord::Migration
  def change
    remove_column :users, :time_zone, :string
    add_column    :systems, :time_zone, :string, default: "Pacific Time (US & Canada)"
  end
end
