class Category < ApplicationRecord
  has_and_belongs_to_many :movies

  before_validation :titleize_name
  validates :name, presence: true, uniqueness: true

  private

  def titleize_name
    self.name = name.titleize
  end
end
