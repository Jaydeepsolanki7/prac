class Catalogue < ApplicationRecord
  has_many :catalogue_amenities, dependent: :destroy
  has_many :amenities, through: :catalogue_amenities
  has_one_attached :catalogue_image

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["amenities", "catalogue_amenities"]
  end
end
