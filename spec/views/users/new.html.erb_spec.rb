require 'rails_helper'

RSpec.describe "users/new", :type => :view do
  before(:each) do
    assign(:user, User.new(
      :email => "MyString",
      :password => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :encrypted_password => "MyString",
      :salt => "MyString",
      :roles => "MyString",
      :instagram_username => "MyString",
      :company_name => "MyString",
      :company_url => "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_password[name=?]", "user[password]"

      assert_select "input#user_first_name[name=?]", "user[first_name]"

      assert_select "input#user_last_name[name=?]", "user[last_name]"

      assert_select "input#user_instagram_username[name=?]", "user[instagram_username]"

      assert_select "input#user_company_name[name=?]", "user[company_name]"

      assert_select "input#user_company_url[name=?]", "user[company_url]"
    end
  end
end
