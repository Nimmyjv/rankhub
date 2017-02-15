class AddSitesNumberToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sites_number, :integer
  end
end
