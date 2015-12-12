require 'rails_helper'

describe "users/index" do
  before do
    assign(:users, [
      User.create!(
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
      ),
      User.create!(
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
      )
    ])
    allow(view).to receive(:current_path).and_return('')
    render template: 'users/index', layout: 'layouts/application'
    rendered
  end

  it "renders a list of users" do
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Instagram Username".to_s, :count => 2
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Company Url".to_s, :count => 2
  end
end
