class DailyGreetingWorker
  include Sidekiq::Worker

  def perform
    users = User.all
    users.each do |user|
      UserMailer.morning_greeting_email.deliver_later
    end
  end
end
