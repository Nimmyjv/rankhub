class AddColumnsToStatistics < ActiveRecord::Migration[5.0]
  def change
    add_column :statistics, :recieved_requests, :integer
    add_column :statistics, :accepted_requests, :integer
    add_column :statistics, :registered_users, :integer
    add_column :statistics, :lists, :integer
    add_column :statistics, :sites, :integer
  end
end
