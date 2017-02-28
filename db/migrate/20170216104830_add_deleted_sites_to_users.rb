class AddDeletedSitesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :deleted_sites, :string, array: true, default: '{}'
  end
end
