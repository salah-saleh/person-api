class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :birthday, :hobbies, :age
end
