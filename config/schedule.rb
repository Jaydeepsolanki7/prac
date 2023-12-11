every 1.day, at: '11:10 am' do
  runner 'MorningGreetingJob.perform_now'
end
