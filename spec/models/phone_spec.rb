require 'rails_helper'

RSpec.describe Phone do
  it 'is correct with valid attributes' do
    phone = build(:phone)
    expect(phone).to be_valid
  end

  describe '#number' do
    it 'is not valid withou a number' do
      phone = build(:phone, number: nil)

      expect(phone).not_to be_valid
      expect(phone.errors.details).to include(number: [{error: :blank}])
    end

    it 'have a unique number' do
      create(:phone, number: 12345678)
      phone = build(:phone, number: 12345678)

      expect(phone).not_to be_valid
      expect(phone.errors.details).to include(number: [{error: :taken, value: '12345678'}])
    end
  end
end
