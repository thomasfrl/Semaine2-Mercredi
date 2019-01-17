require 'dotenv'# Appelle la gem Dotenv
require 'twitter'
require 'pry'
require_relative 'journalists_list.rb'

def methode_connect
	# quelques lignes qui appellent les clés d'API de ton fichier .env
	client = Twitter::REST::Client.new do |config|
	  config.consumer_key        = ENV["TWITTER_API_KEY"]
	  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
	  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
	  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
	end
	return client
end

def methode_streaming
	Dotenv.load
	client = Twitter::Streaming::Client.new do |config|
	  config.consumer_key        = ENV["TWITTER_API_KEY"]
	  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
	  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
	  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
	end
	#binding.pry
	return client
end

def methode_tweet (client)
	# ligne qui permet de tweeter sur ton compte
	client.update('Mon troisième tweet en Ruby !!!! #bonjour_monde')
end

def methode_tweet_journalist(client)
	random_numbers =  []
	3.times do |i|
		random_numbers[i] = rand (0..@journalists.size-1)
	end

	random_numbers.each do |nb|
		client.update("#{@journalists[nb]} Hey I love Ruby too, what are your favorite blogs? :)")
	end
end

 def  methode_favorite(client)
	client.search("#bonjour_monde", result_type: "recent").take(5).each do |tweet|
		client.favorite tweet
	end
end

def methode_follow(client)
	client.search("#bonjour_monde", result_type: "recent").take(3).each do |tweet|
		client.follow tweet.user
	end
end

def methode_tweet_streaming(client)
	client.filter(track: "@bonjour_monde") do |tweet|
	  client.favorite tweet
	  #client.follow tweet.user
	  puts "cool un tweet"
	end
end

methode_tweet_streaming(methode_streaming)
