every 1.day, at: '11:00 am' do
  runner 'MorningGreetingJob.perform_now'
end
