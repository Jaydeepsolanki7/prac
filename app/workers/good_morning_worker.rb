class GoodMorningWorker
  include Sidekiq::Worker

  def perform(user_id)
    debugger
    user = User.find(user_id)
    UserMailer.good_morning_email(user).deliver_now
  end
end
