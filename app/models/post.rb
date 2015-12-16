class Post < ActiveRecord::Base
  belongs_to :user

  validates :instagram_id, uniqueness: true
end
