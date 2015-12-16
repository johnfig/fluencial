class RenamePostsToPostsCountUser < ActiveRecord::Migration
  def change
    rename_column :users, :posts, :posts_count
  end
end
