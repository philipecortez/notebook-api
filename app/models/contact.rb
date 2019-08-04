class Contact < ApplicationRecord
  validates :email, :name, presence: true
  validates :email, :name, uniqueness: true

  belongs_to :kind
end