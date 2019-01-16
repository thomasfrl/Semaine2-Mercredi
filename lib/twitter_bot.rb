require 'dotenv'# Appelle la gem Dotenv
require 'twitter'
require 'pry'
require_relative 'journalists_list.rb'

Dotenv.load # Ceci appelle le fichier .env grâce à la gem Dotenv, et importe toutes les données enregistrées dans un hash ENV

# Il est ensuite très facile d'appeler les données du fichier .env, par exemple là je vais afficher le contenu de la clé TWITTER_API_SECRET
#puts ENV['TWITTER_API_SECRET']

# tout est stocké dans un hash qui s'appelle ENV. Tu peux le regarder en faisant :
#puts ENV

 # ligne très importante qui appelle la gem.

# n'oublie pas les lignes pour Dotenv ici…

# quelques lignes qui appellent les clés d'API de ton fichier .env
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_API_KEY"]
  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

random_numbers =  []
3.times do |i|
	random_numbers[i] = rand (0..@journalists.size-1)
end
binding.pry
# ligne qui permet de tweeter sur ton compte
#client.update('Mon premier tweet en Ruby !!!! #bonjour_monde')


#random_numbers.each do |nb|
#	client.update("#{@journalists[nb]} Hey I love Ruby too, what are your favorite blogs? :)")
#end


#client.search("#bonjour_monde", result_type: "recent").take(25).each do |tweet|
#	client.favorite tweet
#end
#client.search("#bonjour_monde", result_type: "recent").take(20).each do |tweet|
#	client.follow tweet.user
#end
