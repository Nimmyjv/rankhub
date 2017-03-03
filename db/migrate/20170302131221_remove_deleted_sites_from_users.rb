class RemoveDeletedSitesFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :deleted_sites
  end
end
