require 'cron'

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/1' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/1' }
end

Sidekiq.configure_server do |config|
  config.on(:startup) do
    # Schedule the job to run every day at a specific time
    Cron::Job.create('0 12 * * *') do
      DailyGreetingWorker.perform_async
    end
  end
end
