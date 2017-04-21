class BookmarksController < ApplicationController
  def index
      @bookmarks = Bookmark.all
  end

  def show
      @bookmark = Bookmark.find(params[:id])
  end

  def new
      @bookmark = Bookmark.new
  end
    
   def create

     @bookmark = Bookmark.new
     @bookmark.title = params[:bookmark][:title]
     @bookmark.Url = params[:bookmark][:Url]

     if @bookmark.save
       flash[:notice] = "Bookmark was saved."
       redirect_to @bookmark
     else

       flash.now[:alert] = "There was an error saving the bookmark. Please try again."
       render :new
     end
   end    

  def edit
      @bookmark = Bookmark.find(params[:id])
  end
    
   def update
     @bookmark = Bookmark.find(params[:id])
     @bookmark.title = params[:bookmark][:title]
     @bookmark.Url = params[:bookmark][:Url]
 
     if @bookmark.save
       flash[:notice] = "Bookmark was updated."
       redirect_to @bookmark
     else
       flash.now[:alert] = "There was an error saving the bookmark. Please try again."
       render :edit
     end
   end
    
   def destroy
     @bookmark = Bookmark.find(params[:id])
 
     if @bookmark.destroy
       flash[:notice] = "\"#{@bookmark.Url}\" was deleted successfully."
       redirect_to bookmarks_path
     else
       flash.now[:alert] = "There was an error deleting the bookmark."
       render :show
     end
   end
end
