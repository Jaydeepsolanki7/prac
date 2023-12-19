class Review < ApplicationRecord
  belongs_to :post

  def self.ransackable_associations(auth_object = nil)
    ["post"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "id_value", "post_id", "updated_at"]
  end
end
