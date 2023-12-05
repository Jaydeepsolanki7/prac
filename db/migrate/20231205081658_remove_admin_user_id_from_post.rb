class RemoveAdminUserIdFromPost < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :posts, :admin_users
  end
end
