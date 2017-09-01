class AddSocialLinksToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fb_link, :string
    add_column :users, :vk_link, :string
    add_column :users, :tw_link, :string
  end
end
