class User < ActiveRecord::Base
  before_save :encrypt_password
  after_save :clear_password

  has_many :posts

  def self.authenticate(email, login_password)
    user = User.find_by(email: email)
    user if user && user.match_password(login_password)
  end

  def match_password(login_password="")
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end

  def is_advertiser?
    roles.include? 'advertiser'
  end

  def is_influencer?
    roles.include? 'influencer'
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def assign_role(role)
    self.roles ||= []
    self.roles << role
  end

  private

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end
end
