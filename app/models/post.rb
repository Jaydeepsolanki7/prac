class Post < ApplicationRecord
  belongs_to :admin_user
  
  def self.ransackable_attributes(auth_object = nil)
    ["admin_user_id", "created_at", "description", "id", "id_value", "title", "updated_at"]
  end
end
