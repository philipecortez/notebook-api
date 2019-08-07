class Contact < ApplicationRecord
  validates :email, :name, presence: true
  validates :email, :name, uniqueness: true

  belongs_to :kind
  has_many :phones, dependent: :destroy
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true
end