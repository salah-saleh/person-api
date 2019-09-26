class User < ApplicationRecord
  has_secure_password
  before_validation :downcase_email
  validates_presence_of :email, :password
  validates :email, :uniqueness => true, :format => {:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}
  validates :password, :length => {:within => 6..40}

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
