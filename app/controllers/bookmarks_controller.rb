class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @movies = Movie.all
  end

  def create
    @bookmark = Bookmark.new(params[:bookmark].permit(:comment, :movie_id))
    @bookmark.list = List.find(params[:list_id])
    if @bookmark.save
      redirect_to list_path(params[:list_id])
    else
      @list = List.find(params[:list_id])
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end
end
