require 'rails_helper'

RSpec.describe Bookmark, type: :model do

   let(:title) { RandomData.random_paragraph }
   let(:Url) { RandomData.random_paragraph }
    
   let(:topic) { Topic.create!(title: title) }
   let(:bookmark) { Topic.create!(Url: Url) }
    
    it { is_expected.to belong_to(:topic) }
    
    
 
   describe "attributes" do
     it "has title and body attributes" do
       expect(bookmark).to have_attributes(Url: Url)
     end
   end
end
