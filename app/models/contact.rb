class Contact < ApplicationRecord
  validates :email, :name, presence: true
  validates :email, :name, uniqueness: true

  belongs_to :kind

=begin
  def author
    "Philipe S. Cortez"
  end

  def as_json(options={})
    super(
      root: true,
      methods: :author,
      include: :kind
    )
  end
=end
end