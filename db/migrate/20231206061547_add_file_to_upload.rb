class AddFileToUpload < ActiveRecord::Migration[7.1]
  def change
    add_column :uploads, :file, :binary
  end
end
