class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum :role, [:user, :admin]

  
  def after_confirmation
    send_welcome_email
  end

  def self.ransackable_attributes(auth_object = nil)
    ["confirmation_sent_at", "confirmation_token", "confirmed_at", "created_at", "email", "encrypted_password", "id", "id_value", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "unconfirmed_email", "updated_at"]
  end

  
  private
  
    # def enqueue_daily_email_job
    #   DailyEmailWorker.perform_async(self.id)
    # end

    def send_welcome_email
      UserMailer.welcome_email(self).deliver_now
    end  
end
