require 'rails_helper'

RSpec.describe Contact do
  before do
    @contact = build(:contact)
  end

  it "is valid with valid attributes" do
    expect(@contact).to be_valid
  end

  describe '#name' do
    it "is not valid without a name" do
      @contact.name = nil
      expect(@contact).not_to be_valid
      expect(@contact.errors.details).to include(name: [{error: :blank}])
    end

    it "has a unique name" do
      create(:contact, name: "Philipe")
      @contact.name = "Philipe"

      expect(@contact).not_to be_valid
      expect(@contact.errors.details).to include(name: [{error: :taken, value: 'Philipe'}])
    end
  end

  describe '#email' do
    it "is not valid without an email" do
      @contact.email = nil

      expect(@contact).not_to be_valid
      expect(@contact.errors.details).to include(email: [{error: :blank}])
    end

    it "has a unique email" do
      create(:contact, email: "philipesousacortez@protonmail.com")
      @contact.email = "philipesousacortez@protonmail.com"

      expect(@contact).not_to be_valid
      expect(@contact.errors.details[:email]).to include(error: :taken, value: "philipesousacortez@protonmail.com")
    end
  end

  describe '#kind' do
    it 'is not valid without a kind' do
      @contact.kind_id = nil

      expect(@contact).not_to be_valid
      expect(@contact.errors.details).to include(kind: [{error: :blank}])
    end
  end
end