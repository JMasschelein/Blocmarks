require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
    
let(:my_bookmark) { Bookmark.create!(title: RandomData.random_sentence, Url: RandomData.random_paragraph) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
      
     it "assigns [my_bookmark] to @bookmarks" do
       get :index
       expect(assigns(:bookmarks)).to eq([my_bookmark])
     end
  end

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
 
      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end
 
      it "instantiates @bookmark" do
        get :new
        expect(assigns(:bookmark)).not_to be_nil
      end
    end
 
    describe "POST create" do

      it "increases the number of Bookmark by 1" do
        expect{bookmark :create, bookmark: {title: RandomData.random_sentence, Url: RandomData.random_paragraph}}.to change(Bookmark,:count).by(1)
      end
 
      it "assigns the new post to @bookmark" do
        bookmark :create, bookmark: {title: RandomData.random_sentence, URL: RandomData.random_paragraph}
        expect(assigns(:bookmark)).to eq Bookmark.last
      end
 
      it "redirects to the new bookmark" do
        bookmark :create, bookmark: {title: RandomData.random_sentence, Url: RandomData.random_paragraph}
        expect(response).to redirect_to Bookmark.last
      end
    end
    
   describe "GET show" do
     it "returns http success" do
       get :show, {id: my_bookmark.id}
       expect(response).to have_http_status(:success)
     end
     it "renders the #show view" do
       get :show, {id: my_bookmark.id}
       expect(response).to render_template :show
     end
 
     it "assigns my_bookmark to @bookmark" do
       get :show, {id: my_bookmark.id}
       expect(assigns(:bookmark)).to eq(my_bookmark)
     end
   end
    
   describe "GET edit" do
     it "returns http success" do
       get :edit, {id: my_bookmark.id}
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get :edit, {id: my_bookmark.id}
       expect(response).to render_template :edit
     end
 
     it "assigns bookmark to be updated to @bookmark" do
       get :edit, {id: my_bookmark.id}
 
       bookmark_instance = assigns(:bookmark)
 
       expect(bookmark_instance.id).to eq my_bookmark.id
       expect(bookmark_instance.title).to eq my_bookmark.title
       expect(bookmark_instance.Url).to eq my_bookmark.Url
     end
   end
    
   describe "PUT update" do
     it "updates bookmark with expected attributes" do
       new_title = RandomData.random_sentence
       new_Url = RandomData.random_paragraph
 
       put :update, id: my_bookmark.id, bookmark: {title: new_title, Url: new_Url}
 
       updated_bookmark = assigns(:bookmark)
       expect(updated_bookmark.id).to eq my_bookmark.id
       expect(updated_bookmark.title).to eq new_title
       expect(updated_bookmark.Url).to eq new_Url
     end
 
     it "redirects to the updated bookmark" do
       new_title = RandomData.random_sentence
       new_Url = RandomData.random_paragraph
 
       put :update, id: my_bookmark.id, bookmark: {title: new_title, Url: new_Url}
       expect(response).to redirect_to my_bookmark
     end
   end
    
   describe "DELETE destroy" do
     it "deletes the bookmark" do
       delete :destroy, {id: my_bookmark.id}
       count = Bookmark.where({id: my_bookmark.id}).size
       expect(count).to eq 0
     end
 
     it "redirects to bookmarks index" do
       delete :destroy, {id: my_bookmark.id}
       expect(response).to redirect_to bookmarks_path
     end
   end
    
end
