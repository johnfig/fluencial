require 'rails_helper'

feature 'registration page' do
  scenario 'logged in member who goes to registration page' do
    user = create :user
    login_as(user)
    visit signup_path
    expect(page.current_path).to eq '/'
  end

  scenario 'logged in member who goes to registration page' do
    visit signup_path
    expect(page.current_path).to eq '/signup'
    fill_in_signup_form
    click_button 'Sign up'
    expect(User.last.email).to eq 'mario@pipes.com'
    expect(User.last.roles).to eq ['advertiser']
  end

  scenario 'user logs out after registration', :js do
    visit signup_path
    expect(page.current_path).to eq '/signup'
    fill_in_signup_form
    click_button 'Sign up'
    expect(User.last.email).to eq 'mario@pipes.com'
    expect(User.last.roles).to eq ['advertiser']
    expect(page.find('.dropdown-toggle')).to have_content 'Account'
    click_link 'Account'
    click_link 'Log out'
    expect(page.find('.navbar-nav')).to have_content 'Sign up'
  end

  scenario 'user signs up with instagram' do
    pending 'stop messing around and get this done'
    fail
  end

  def fill_in_signup_form
    fill_in 'First name', with: 'mario'
    fill_in 'Last name', with: 'pipes'
    fill_in 'Email', with: 'mario@pipes.com'
    fill_in 'Password', with: 'password'
    fill_in 'Company name', with: 'fluencial'
    fill_in 'Company url', with: 'fluencial.co'
  end
end
