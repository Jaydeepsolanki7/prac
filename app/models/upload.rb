class Upload < ApplicationRecord
  has_one_attached :file
  has_many :tips
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "file", "id", "id_value", "title", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["file_attachment", "file_blob"]
  end
end
