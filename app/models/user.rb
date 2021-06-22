class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articles

  validates :username, presence: true,
                      length: { minimum: 3, maximum: 25 },
                      uniqueness: { case_sensitive: false }
  VALIDATE_EMAIL_REGEX = /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { minimum: 3, maximum: 25 },
                    uniqueness: { case_sensitive: false },
                    format: { with: VALIDATE_EMAIL_REGEX}

  has_secure_password

end
