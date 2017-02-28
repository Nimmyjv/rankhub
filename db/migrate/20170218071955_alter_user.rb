class AlterUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :lists_number
    remove_column :users, :sites_number
    remove_column :users, :sites
    remove_column :users, :deleted_sites
    remove_column :users, :present_sites
  end
end


