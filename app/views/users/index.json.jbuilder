json.array!(@users) do |user|
  json.extract! user, :id, :email, :password, :first_name, :last_name, :encypted_password, :salt, :roles, :instagram_username, :company_name, :company_url
  json.url user_url(user, format: :json)
end
