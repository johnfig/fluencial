require 'rails_helper'

RSpec.describe "users/show", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :email => "Email",
      :password => "Password",
      :first_name => "First Name",
      :last_name => "Last Name",
      :encrypted_password => "Encrypted Password",
      :salt => "Salt",
      :roles => "Roles",
      :instagram_username => "Instagram Username",
      :company_name => "Company Name",
      :company_url => "Company Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Encrypted Password/)
    expect(rendered).to match(/Salt/)
    expect(rendered).to match(/Roles/)
    expect(rendered).to match(/Instagram Username/)
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/Company Url/)
  end
end
