class User < ApplicationRecord
  validates :name, presence: true,
    length: {maximum: Settings.user.max_length_name}
  validates :email, presence: true,
    length: {maximum: Settings.user.max_length_email},
    format: {with: Settings.user.email_regex},
    uniqueness: {case_sensitive: true}
  validates :password, presence: true,
    length: {minimum: Settings.users.min_length_password}, allow_nil: true
  before_save{email.downcase!}

  has_secure_password
end
