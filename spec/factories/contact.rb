FactoryBot.define do
  factory :contact, class: Contact do
    sequence(:name) { |n| "#{Faker::Name.first_name}#{n}" }
    email { Faker::Internet.safe_email }
    birthdate { Faker::Date.between(from: 65.years.ago, to: 18.years.ago) }
  end
end