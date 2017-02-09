class AddAcceptToInvite < ActiveRecord::Migration[5.0]
  def change
    add_column :invites, :accept, :boolean
  end
end
