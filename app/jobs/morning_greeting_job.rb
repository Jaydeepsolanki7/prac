class MorningGreetingJob < ApplicationJob
  queue_as :default

  def perform
    users = User.all
    users.each do |user|
      UserMailer.morning_greeting_email(user).deliver_now
  end
end
