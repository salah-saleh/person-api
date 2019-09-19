class Person < ApplicationRecord
  # validation
  validates_presence_of :name, :birthday
end
