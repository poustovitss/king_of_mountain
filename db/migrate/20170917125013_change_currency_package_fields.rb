class ChangeCurrencyPackageFields < ActiveRecord::Migration[5.1]
  def up
    change_column :packages, :price, :decimal, precision: 8, scale: 3
  end

  def down
    change_column :packages, :price, :float, default: 0.0, nil: false
  end
end
