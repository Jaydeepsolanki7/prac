class CatalogueAmenity < ApplicationRecord
  belongs_to :catalogue
  belongs_to :amenity

  def self.ransackable_associations(auth_object = nil)
    ["amenity", "catalogue"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["amenity_id", "catalogue_id", "created_at", "id", "id_value", "name", "updated_at"]
  end
end
