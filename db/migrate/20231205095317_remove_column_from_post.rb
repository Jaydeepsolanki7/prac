class RemoveColumnFromPost < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :admin_user_id, :integer
  end
end
