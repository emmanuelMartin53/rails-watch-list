class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @movies = Movie.all
    @bookmark = Bookmark.new
  end


 def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
   if @bookmark.save
      redirect_to lists_path(@list)
   else
       render :new, status: :unprocessable_entity
   end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    #@list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private


  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
