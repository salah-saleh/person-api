class Person < ApplicationRecord
  # validation
  validates_presence_of :name, :birthday

  def age
    age = Date.today.year - self.birthday.year
    if Date.today < self.birthday + age
      age - 1
    else
      age
    end
  end

  def self.total_age
    Person.all.map(&:age).inject(0, &:+)
  end
end
