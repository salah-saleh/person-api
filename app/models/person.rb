class Person < ApplicationRecord
  before_action :authenticate_user
  # validation
  validates_presence_of :name, :birthday
end
