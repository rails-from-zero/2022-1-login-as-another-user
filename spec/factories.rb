FactoryBot.define do
  factory :user do
    sequence(:name) { |i| "John #{i}" }
    sequence(:email) { |i| "John#{i}@example.com" }
    password { "secret" }
    password_confirmation { "secret" }
  end
end
