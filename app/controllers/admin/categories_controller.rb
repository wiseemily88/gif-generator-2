class Admin::CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.find_or_create_by(category_params)
    api_response = ApiService.new(@category.name)
    api_response.parse_json.each do |url|
      @category.gifs.create(image_path: url)
    end
    redirect_to admin_categories_path
  end

  def index
    @categories = Category.all
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    flash[:success] = "#{@category.name} was successfully deleted!"
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
