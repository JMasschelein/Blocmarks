require 'rails_helper'

RSpec.describe Bookmark, type: :model do
   let(:bookmark) { Bookmark.create!(title: "New Bookmark Title", Url: "New Url Body") }
 
   describe "attributes" do
     it "has title and body attributes" do
       expect(bookmark).to have_attributes(title: "New Bookmark Title", Url: "New Url Body")
     end
   end
end
