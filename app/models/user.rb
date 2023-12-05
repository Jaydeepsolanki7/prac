class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum :role, [:user, :admin]
  def self.ransackable_attributes(auth_object = nil)
    ["confirmation_sent_at", "confirmation_token", "confirmed_at", "created_at", "email", "encrypted_password", "id", "id_value", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "unconfirmed_email", "updated_at"]
  end
end
