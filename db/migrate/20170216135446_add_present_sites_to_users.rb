class AddPresentSitesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :present_sites, :string, array: true, default: '{}'
  end
end
