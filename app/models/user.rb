class User < ApplicationRecord
  has_secure_password
  has_many :movies

  before_validation :downcase_email
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: {in: 6..30}

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
