class DailyGreetingWorker
  include Sidekiq::Worker

  def perform
    User.find_each do |user|
      UserMailer.send_daily_email(user).deliver_now
    end
  end
end
