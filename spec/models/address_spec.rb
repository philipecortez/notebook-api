require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '#city' do
    it 'cant be blank' do
      address = build(:address, city: nil)

      expect(address).not_to be_valid
      expect(address.errors.details).to include(city: [{error: :blank}])
    end
  end

  describe '#street' do
    it 'cant be blank' do
      address = build(:address, street: nil)

      expect(address).not_to be_valid
      expect(address.errors.details).to include(street: [{error: :blank}])
    end
  end
end
