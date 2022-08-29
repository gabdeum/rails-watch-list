class ReviewsController < ApplicationController
  def create
    @review = Review.new(params[:review].permit(:rating, :comment))
    @review.list = List.find(params[:list_id])
    if @review.save
      redirect_to list_path(params[:list_id])
    else
      @list = List.find(params[:list_id])
      render 'lists/show', status: :unprocessable_entity
    end
  end
end
