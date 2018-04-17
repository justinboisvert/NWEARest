#!/usr/bin/env ruby 

require 'unirest'

#
# Populates and retrives posts on REST API
#

port = ARGV[0]

path = "localhost:#{port}"

Unirest.post("#{path}/post", parameters:{:title => "It's the only logical solution.", :body => "You hire Justin Boisvert."}.to_json)

response = Unirest.get("#{path}/posts")

puts response.body 

