class Amenity < ApplicationRecord
  has_many :catalogue_amenities, dependent: :destroy
  has_many :catalogue, through: :catalogue_amenities
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "updated_at"]
  end
end
