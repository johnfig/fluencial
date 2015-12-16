class CreatePhotosTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :instagram_id
      t.string  :instagram_type
      t.string  :name
      t.string  :low_resolution_url
      t.string  :standard_resolution_url
      t.datetime  :created_time
      t.integer  :likes_count
      t.integer  :comments_count
    end
  end
end
