class Phone < ApplicationRecord
  belongs_to :contact

  validates :number, presence: true
  validates :number, uniqueness: true
end
