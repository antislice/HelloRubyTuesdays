FactoryGirl.define do
  
  factory :user, class: User do
    name                  { Faker::Name.name }
    email                 { Faker::Internet.email }
    uid					  { Faker::Lorem.characters(10) }
    password              "foobar"
    password_confirmation "foobar"
    about_text            "I'm a test user!"
  end

end