class AddActiveToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :active, :boolean, default: false, nil: false
  end
end