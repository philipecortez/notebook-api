FactoryBot.define do
  factory :contact, class: Contact do
    name { Faker::Name.first_name }
    email { Faker::Internet.safe_email }
    birthdate { Faker::Date.between(from: 65.years.ago, to: 18.years.ago) }
  end
end