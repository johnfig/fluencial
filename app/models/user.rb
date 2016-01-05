class User < ActiveRecord::Base
  before_save :encrypt_password
  before_save :set_gender
  after_save  :clear_password

  has_many :posts

  scope :with_role, lambda { |role| where('? = ANY(roles)', role) }
  scope :most_followed, -> { order('followed_by DESC') }

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

  def set_gender
    detector = GenderDetector.new(case_sensitive: false)
    if detector.get_gender(self.first_name) == :female
      self.gender = 1
    elsif detector.get_gender(self.first_name) == :male
      self.gender = 2
    end
  end
end
