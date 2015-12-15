class HomeController < ApplicationController
  def index
    @top_users = User.first(8)
  end
end
