
ENV['RAILS_ENV'] ||= 'development'
require File.expand_path(File.dirname(__FILE__) + '/environment/')

every 1.day, at: '9:00 am' do
  User.find_each do |user|
    runner "GoodMorningWorker.perform_async(#{user.id})"
  end
end
