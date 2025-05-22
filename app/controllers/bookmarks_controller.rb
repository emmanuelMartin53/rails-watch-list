class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @movies = Movie.all
    @bookmark = Bookmark.new
  end


 def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
     if @bookmark.save
        redirect_to bookmark_path(@bookmark)
     else
        render :new, status: :unprocessable_entity
     end
  end

  private


  def bookmark_params
    params.require(:bookmark).permit(:content, :list_id, :movie_id)
  end
end
