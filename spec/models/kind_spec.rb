require 'rails_helper'

RSpec.describe Kind do
  it 'is valid with valid attributes' do
    kind = build(:kind)
    expect(kind).to be_valid, status: :ok
  end

  it 'is not valid without a description' do
    kind = build(:kind, description: nil)
    expect(kind).not_to be_valid
  end
end