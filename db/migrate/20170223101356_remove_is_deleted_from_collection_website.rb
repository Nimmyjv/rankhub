class RemoveIsDeletedFromCollectionWebsite < ActiveRecord::Migration[5.0]
  def change
    remove_column :collection_websites, :is_deleted, :boolean
  end
end
