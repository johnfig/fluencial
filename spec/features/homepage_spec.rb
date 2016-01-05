require 'rails_helper'

feature 'homepage spec' do
  scenario 'users can be directed to influencer page from top users section' do
    user = create :user, :influencer
    post = create :post, user: user
    visit '/'
    page.find('.top-users a').click
    expect(page.all('.post-container').count).to eq 1
    expect(page.find('.post-container img')[:src]).to eq post.low_resolution_url
    expect(page.find('.user-container img')[:src]).to eq user.profile_picture_url
  end
end
