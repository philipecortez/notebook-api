class Address < ApplicationRecord
  belongs_to :contact

  validates :city, :street, presence: true
end
