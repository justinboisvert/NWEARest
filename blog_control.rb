#!/usr/bin/env ruby
#
# Control to add and retrieve posts in a SQLite3 based blog.
#
require 'sqlite3'

#
# Safe value method that prevents ' character from string that breaks sqlite3 statement
#
def sv(content)
  return content.gsub("'","&apos;")
end
#
# Reverse save value method that reverse the &apos; character encoding back to an apostrophe
#
def sv_(content)
  return content.gsub("&apos;","'")
end

module BlogControl

 @@conn = SQLite3::Database.new("blog.db")

 def self.retrievePosts
   posts = []
   @@conn.execute("SELECT * FROM posts") do |row|
     posts.push({"post_id" => row[0].to_i, "title" => sv_(row[1]), "body" => sv_(row[2])})
   end
   return posts
 end

 def self.addPost(title,body)
  @@conn.execute("INSERT INTO posts(title,body) VALUES ('#{sv(title)}','#{sv(body)}')")
 end


end

