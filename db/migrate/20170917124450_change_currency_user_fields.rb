class ChangeCurrencyUserFields < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :earned_amount, :decimal, precision: 8, scale: 3
    change_column :users, :balance, :decimal, precision: 8, scale: 3
    change_column :users, :score, :integer, default: 0, nil: false
  end

  def down
    change_column :users, :earned_amount, :float, default: 0.0, nil: false
    change_column :users, :balance, :float, default: 0.0, nil: false
    change_column :users, :score, :float, default: 0.0, nil: false
  end
end
