class User < ActiveRecord::Base
  # attr_accessor :name, :email, :age

  before_save { self.password = Digest::MD5::hexdigest(password)}

  validates :name, presence: true, length: {maximum: 10}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                     format: {with: VALID_EMAIL_REGEX},
                     uniqueness: { case_sensitive: false }
# rails 内置方法，用来生成安全密码
#  has_secure_password

  validates :password, presence: true, length: {minimum: 6, maximum: 15}

end