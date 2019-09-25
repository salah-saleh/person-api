class Movie < ApplicationRecord
  has_many :ratings
  has_and_belongs_to_many :categories
  belongs_to :user

  before_validation :titleize_title
  validates :title, presence: true
  validates :text, presence: true


  def rating
    {
      score: self.ratings.present? ? (self.ratings.map(&:score).inject(0, &:+) / self.ratings.count).floor : 0,
      count: self.ratings.count
    }
  end

  private

  def titleize_title
    self.title = title.titleize
  end

end
