class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.string :name
      t.string :slug
      t.float :price, default: 0.0, nil: false
      t.integer :level, default: 0, nil: false
      t.integer :max_levels, default: 0, nil: false
      t.integer :progress, default: 0, nil: false
      t.integer :max_progress, default: 0, nil: false
      t.float :profit, default: 0, nil: false
      t.boolean :active, default: false, nil: false
      t.references :user

      t.timestamps
    end
  end
end
