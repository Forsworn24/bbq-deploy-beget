FactoryBot.define do
  factory :user do
    name { "Test #{rand(777)}" }
    sequence(:email) { |n| "alex#{n}@yandex.ru" }
    after(:build) { |u| u.password_confirmation = u.password = '777777' }
  end
end
