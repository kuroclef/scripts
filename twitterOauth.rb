#!/usr/bin/ruby
# coding: utf-8

# http://d.hatena.ne.jp/riocampos+tech/20130615/p1

require "bundler/setup"
require "oauth"

puts "Input your consumer_key:"
consumer_key    = gets.chomp
puts "Input your consumer_secret:"
consumer_secret = gets.chomp

oauth = OAuth::Consumer.new(
  consumer_key,
  consumer_secret,
  site: "https://api.twitter.com"
)

request_token = oauth.get_request_token

puts "Access this URL: #{request_token.authorize_url}"
puts "Input your PIN code: "
pincode = gets.chomp

access_token = request_token.get_access_token(oauth_verifier: pincode)

puts "access_token        : #{access_token.token}"
puts "access_token_secret : #{access_token.secret}"
