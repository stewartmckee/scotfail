

task :request_tweets => :environment do
  TwitterConnector.update
end