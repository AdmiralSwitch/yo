class ReviewsController < ApplicationController
  def index
    @reviews = if params[:keywords]
                 Recipe.where('name ilike ?',"%#{params[:keywords]}%")
               else
                 []
               end
  end
end
