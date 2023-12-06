class RemoveDescriptionFromUpload < ActiveRecord::Migration[7.1]
  def change
    remove_column :uploads, :description, :string
  end
end
