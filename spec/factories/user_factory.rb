FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
    password "654321"
    first_name "User"
    last_name "Test"
    admin false
  end

  factory :admin, class: User do
    email
    password "654321"
    first_name "Test"
    last_name "Admin"
    admin true
  end

end
