class AddInstagramInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :posts, :integer
    add_column :users, :followed_by, :integer
    add_column :users, :follows, :integer
    add_column :users, :profile_picture_url, :string
    add_column :users, :personal_website, :string
    add_column :users, :instagram_id, :string
    add_column :users, :bio, :text
  end
end
