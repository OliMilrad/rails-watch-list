class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie_id = params[:bookmark][:movie_id]
    @bookmark.list = @list
    @bookmark.save!
  end

  def destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
