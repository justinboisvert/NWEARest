#!/usr/bin/env ruby 

require 'unirest'

#
# Populates and retrives posts on REST API that assumes it's running on 8080
#

path = "localhost:8080"

Unirest.post("#{path}/post", parameters:{:title => "It's the only logical solution.", :body => "You hire Justin Boisvert."}.to_json)

response = Unirest.get("#{path}/posts")

puts response.body 

