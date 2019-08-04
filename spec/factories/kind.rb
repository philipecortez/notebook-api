FactoryBot.define do
  factory :kind, class: Kind do
    description { ['Friend', 'Coleague', 'Comercial'].sample }
  end
end