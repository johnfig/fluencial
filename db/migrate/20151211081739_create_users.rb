class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :encypted_password
      t.string :salt
      t.string :roles, array: true, default: []
      t.string :instagram_username
      t.string :company_name
      t.string :company_url

      t.timestamps null: false
    end
  end
end
