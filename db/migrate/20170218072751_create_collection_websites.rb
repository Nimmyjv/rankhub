class CreateCollectionWebsites < ActiveRecord::Migration[5.0]
  def change
    create_table :collection_websites do |t|
      t.integer :collection_id
      t.integer :website_id
      t.boolean :is_deleted, default: false

      t.timestamps
    end
  end
end
