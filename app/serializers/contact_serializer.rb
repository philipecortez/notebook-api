class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  attribute :formated_birthdate, key: :birthdate

  belongs_to :kind do
    link(:related) { api_v1_contact_kind_url(object) }
  end

  has_many :phones do
    link(:related) { api_v1_contact_phones_url(object) }
  end

  has_one :address do
    link(:related) { api_v1_contact_address_url(object) }
  end

  def formated_birthdate
    object.birthdate.to_time.iso8601
  end

  meta do
    { author: 'Philipe S. Cortez' }
  end
end
