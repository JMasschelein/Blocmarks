require 'rails_helper'

RSpec.describe Topic, type: :model do

   let(:title) { RandomData.random_sentence }
   let(:topic) { Topic.create!(title: title) }
    
   it { is_expected.to have_many(:bookmarks) }

   describe "attributes" do
     it "has name, description, and public attributes" do
       expect(topic).to have_attributes(title: title)
     end
   end    
    
end
