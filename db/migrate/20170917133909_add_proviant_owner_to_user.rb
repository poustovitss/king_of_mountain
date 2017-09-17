class AddProviantOwnerToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :proviant_owner, :integer
  end
end
