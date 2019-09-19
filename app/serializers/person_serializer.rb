class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :birthday, :hobbies, :age

  def age
    age = Date.today.year - object.birthday.year
    if Date.today < object.birthday + age
      age -1
    else
      age
    end
  end
end
