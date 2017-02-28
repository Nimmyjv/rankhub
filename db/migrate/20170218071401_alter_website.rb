class AlterWebsite < ActiveRecord::Migration[5.0]
  def change
    remove_column :websites, :user_id
    remove_column :websites, :collection_id
  end
end
