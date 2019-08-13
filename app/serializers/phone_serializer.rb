class PhoneSerializer < ActiveModel::Serializer
  attributes :id, :number

  belongs_to :contact do
    link(:related) { api_v1_contact_phones_url(object.contact) }
  end
end
