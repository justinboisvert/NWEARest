#!/usr/bin/env ruby
#
# Control to add and retrieve posts in a SQLite3 based blog.
#
require 'sqlite3'

#
# Safe value method that prevents ' character from string that breaks sqlite3 statement
#
def sv(content)
  return sv.gsub("'","&apos;")
end
#
# Reverse save value method that reverse the &apos; character encoding back to an apostrophe
#
def sv_(content)
  return sv.gsub("&apos;","'")
end

module BlogControl

 @@conn = SQLite3::Database.new("blog.db")

 def self.retrievePosts
   posts = []
   @@conn.exec("SELECT * FROM posts") do |row|
     posts.push({"post_id" => row["post_id"].to_i, "title" => sv_(row["title"]), "body" => sv_(row["body"])})
   end
   return posts
 end

 def self.addPost(title,body)
  @@conn.exec("INSERT INTO posts(title,body) VALUES ('#{sv(title)}','#{sv(body)}')")
 end

end

