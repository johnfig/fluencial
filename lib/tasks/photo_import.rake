namespace :photo_import do
  desc 'Update all photo data of users with correct access tokens'
  task :import => [:environment] do
    User.find_each do |user|
      response = get_photos(user.access_token)
      byebug
      next if 'no valid access token'
    end
  end


  private
  def get_photos(access_token)
    url = "https://api.instagram.com/v1/users/self/media/recent/?access_token=#{access_token}"
    begin
      HTTParty.get(url)
    rescue
      'no valid access token'
    end
  end
end
