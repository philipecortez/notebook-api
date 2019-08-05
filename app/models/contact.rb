class Contact < ApplicationRecord
  validates :email, :name, presence: true
  validates :email, :name, uniqueness: true

  belongs_to :kind
  has_many :phones, dependent: :destroy

  accepts_nested_attributes_for :phones

  def as_json(options={})
    super(options.merge(include: [:kind, :phones]))
  end

end