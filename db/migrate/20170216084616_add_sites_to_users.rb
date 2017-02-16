class AddSitesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sites, :string, array: true, default: '{}'
  end
end
