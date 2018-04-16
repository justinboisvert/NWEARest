#!/usr/bin/env ruby

require 'cuba'
require 'json'
require_relative 'blog_control'
Cuba.define do 
  on get do
    #
    # GET /posts - Return list of all posts in blog
    #
    on "posts" do
      res.write(JSON.pretty_generate(BlogControl.retrievePosts))
    end
  end
    #
    # POST /post - Post a blog post
    #
  on post do
    on "post" do
      request = JSON.load(req.body.read)
      BlogControl.addPost(request["title"],request["body"]) 
    end
  end
end
