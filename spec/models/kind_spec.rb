require 'rails_helper'

RSpec.describe Kind do
  it 'is valid with valid attributes' do
    kind = build(:kind)
    expect(kind).to be_valid
  end

  describe '#description' do
    it 'is not valid without a description' do
      kind = build(:kind, description: nil)

      expect(kind).not_to be_valid
      expect(kind.errors.details).to include(description: [{error: :blank}])
    end
  end
end