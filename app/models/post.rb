class Post < ApplicationRecord

  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :reviews, allow_destroy: true

  enum post_type: [:real, :animated]
  has_one_attached :image

  validates :title, presence: true
  validates :title, uniqueness: { case_sensitive: false }
  validates :post_type, presence: true
  validates :image,
            presence: true,
            content_type: [:gif, :jpg, :jpeg, :png],
            size: {greater_than: 2.megabytes, message: 'must be greater than 2MB in size' }

  after_save :perform_after_save
  after_commit :perform_after_commit
  
  def perform_after_save
    puts "After save callback: #{description} is the description of the post"
  end
  
  def perform_after_commit
    if saved_change_to_attribute?(:description)
      puts "After commit callback: Description was changed to '#{description}'"
    end
  end
  
  def self.import_csv(file)
    CSV.foreach(file.path, headers: true) do |row|
      Post.create!(title: row['title'], description: row['description'])
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "id_value", "title", "updated_at"]
  end
end
