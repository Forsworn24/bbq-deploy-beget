# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    association :user
    title { 'Проверка полиции' }
    address { 'Москва' }
    datetime { DateTime.parse('11.01.2021 11:11') }
  end
end
