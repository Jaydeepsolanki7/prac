class Post < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "id_value", "title", "updated_at"]
  end

  def self.import_csv(file)
    debugger
    CSV.foreach(file.path, headers: true) do |row|
      Post.create!(title: row['title'], description: row['description'])
    end
  end
end
