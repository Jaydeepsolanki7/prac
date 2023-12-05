class RemoveIndexAdminUserIdFromPost < ActiveRecord::Migration[7.1]
  def change
    remove_index :posts, :admin_user_id
  end
end
