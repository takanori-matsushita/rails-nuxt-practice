FactoryBot.define do
  factory :michael, class: User do
    name { "Michael Example" }
    email { "michael@example.com" }
    password { "password" }
    password_confirmation { "password" }
    admin { true }
  end
  
  factory :sterling, class: User do
    name { "Sterling Archer" }
    email { "sterling@example.gov" }
    password { "password" }
    password_confirmation { "password" }
  end
  
  factory :lana, class: User do
    name { "Lana Kane" }
    email { "lana@example.gov" }
    password { "password" }
    password_confirmation { "password" }
  end
  
  factory :malory, class: User do
    name { "Malory Archer" }
    email { "malory@example.gov" }
    password { "password" }
    password_confirmation { "password" }
  end
  
  30.times do |n|
    factory "users#{n}".to_sym, class: User do
      name { "User#{n}" }
      email { "user-#{n}@example.com" }
      password { "password" }
      password_confirmation { "password" }
    end
  end
end