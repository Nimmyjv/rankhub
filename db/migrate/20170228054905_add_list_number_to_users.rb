class AddListNumberToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :list_number, :integer
    add_column :users, :site_number, :integer
    add_column :users, :sites, :string, array: true, default: '{}'
    add_column :users, :deleted_sites, :string, array: true, default: '{}'


  end
end
