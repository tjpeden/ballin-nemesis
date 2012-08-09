class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @categories = Category.where(name: /#{params[:term]}/i)

    respond_to do |format|
      format.json { render json: @categories.map(&:name) }
    end
  end
end
