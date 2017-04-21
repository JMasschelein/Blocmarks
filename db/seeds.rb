 require 'random_data'

 # Create Bookmarks
 50.times do
 # #1
   Bookmark.create!(
 # #2
     title:  RandomData.random_sentence,
     Url:   RandomData.random_paragraph
   )
 end
 bookmarks = Bookmark.all

 
 puts "Seed finished"
 puts "#{Bookmark.count} bookmarks created"