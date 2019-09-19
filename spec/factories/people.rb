FactoryBot.define do
  factory :person do
    name { Faker::Lorem.word }
    birthday { Faker::Date }
    hobbies { Faker::Lorem.word(5) }
  end
end
