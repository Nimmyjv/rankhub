class AddListsNumberToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :lists_number, :integer
  end
end
