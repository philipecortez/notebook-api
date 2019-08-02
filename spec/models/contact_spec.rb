require 'rails_helper'

RSpec.describe Contact do
  it "is valid with valid attributs" do
    contact = build(:contact)
    expect(contact).to be_valid
  end

  it "is not valid without an email" do
    contact = build(:contact, email: nil)
    expect(contact).not_to be_valid
  end

  it "is not valid without a name" do
    contact = build(:contact, name: nil)
    expect(contact).not_to be_valid
  end

  it "has a unique name" do
    create(:contact, name: "Philipe")
    contact = build(:contact, name: "Philipe")

    expect(contact).not_to be_valid
    expect(contact.errors.messages).to eq(name: ["has already been taken"])
  end

  it "has a unique email" do
    create(:contact, email: "philipesousacortez@protonmail.com")
    contact = build(:contact, email: "philipesousacortez@protonmail.com")

    expect(contact).not_to be_valid
    expect(contact.errors.messages).to eq(email: ["has already been taken"])
  end
end