 require 'random_data'

 # Create Bookmarks
 50.times do

   Bookmark.create!(
     
     Url:   RandomData.random_paragraph
   )
 end
 bookmarks = Bookmark.all

 # Create Topics
 15.times do
   Topic.create!(
     title: RandomData.random_sentence,
   )
 end
 topics = Topic.all 


 puts "Seed finished"
puts "#{Topic.count} topics created"
 puts "#{Bookmark.count} bookmarks created"