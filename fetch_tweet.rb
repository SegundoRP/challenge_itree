require 'twitter'
require 'dotenv'

class FetchTweet

   attr_accessor :mentions

  def initialize
    Dotenv.load
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['consumer_key']
      config.consumer_secret = ENV['consumer_secret']
      config.access_token = ENV['access_token']
      config.access_token_secret = ENV['access_token_secret']
    end
  end

  def catch_mentions
    @mentions = @client.mentions_timeline
  end

  def self.update_status(tweet)
    @client.update(tweet)
  end
end
