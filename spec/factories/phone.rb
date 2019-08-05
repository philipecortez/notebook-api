FactoryBot.define do
  factory :phone, class: Phone do
    number { Faker::Base.numerify('+55 (##) ##### - ####') }
    contact { create(:contact) }
  end
end
