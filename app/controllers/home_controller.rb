class HomeController < ApplicationController
  def index
    @top_users = User.with_role('influencer').most_followed.limit(40).shuffle.first(8)
  end
end
