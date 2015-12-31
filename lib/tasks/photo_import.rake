namespace :photo_import do
  desc 'Update all photo data of users with correct access tokens'
  task :import => [:environment] do
    User.with_role('influencer').find_each do |user|
      response = get_photos(user.access_token)
      next if response == 'no valid access token'
      response['data'].each do |post_data|
        post = Post.where(instagram_id: post_data['id']).first || Post.new
        post.user_id = user.id
        post.instagram_id = post_data['id']
        post.instagram_type = post_data['type']
        post.name = post_data['caption']['text'] if post_data['caption']
        post.thumbnail_url = post_data['images']['thumbnail']['url']
        post.low_resolution_url = post_data['images']['low_resolution']['url']
        post.standard_resolution_url = post_data['images']['standard_resolution']['url']
        post.created_time = DateTime.strptime(post_data['created_time'], '%s')
        post.likes_count = post_data['likes']['count']
        post.comments_count = post_data['comments']['count']
        post.save
      end
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
