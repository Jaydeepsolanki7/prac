class SendHowAreYouEmailJob < ApplicationJob
  queue_as :default

  def perform
    User.find_each do |user|
      UserMailer.how_are_you_email(user).deliver_later
    end
  end
end
