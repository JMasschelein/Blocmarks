class BookmarksController < ApplicationController


  def show
      @bookmark = Bookmark.find(params[:id])
  end

  def new
      @topic = Topic.find(params[:topic_id])
      @bookmark = Bookmark.new
  end
    
   def create

     @bookmark = Bookmark.new
     @bookmark.title = params[:bookmark][:title]
     @bookmark.Url = params[:bookmark][:Url]
     @topic = Topic.find(params[:topic_id])
     @bookmark.topic = @topic

     if @bookmark.save
       flash[:notice] = "Bookmark was saved."
       redirect_to [@topic, @bookmark]
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
       flash[:notice] = "Bookmark was saved."
       redirect_to topic_bookmark_url
     else

       flash.now[:alert] = "There was an error saving the bookmark. Please try again."
       render :new
     end
   end
    
   def destroy
     @bookmark = Bookmark.find(params[:id])
 
     if @bookmark.destroy
       flash[:notice] = "\"#{@bookmark.Url}\" was deleted successfully."
       redirect_to @bookmark.topic
     else
       flash.now[:alert] = "There was an error deleting the bookmark."
       render :show
     end
   end
end
