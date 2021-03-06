class FavoriteGifsController < ApplicationController
  def index
    @gifs = []
    favorite_gifs = current_user.favorite_gifs
    favorite_gifs.each {|favorite|  @gifs << Gif.find(favorite.gif_id) }
  end

  def new
    @favorite_gif = FavoriteGif.new
  end

  def create
    current_user.favorite_gifs.create(gif_id: favorite_params[:gif_id])
    redirect_to user_favorite_gifs_path(current_user)
  end

  def query
    @gifs = []
    favorite_gifs = current_user.favorite_gifs
    favorite_gifs.each {|favorite|  @gifs << Gif.find(favorite.gif_id) }
    @sorted_hash = Hash.new
    @gifs.each do |gif|
      category = gif.category.name
      @sorted_hash[category] = gif
    end
  end

  def destroy
    @favorite_gif = FavoriteGif.find_by(gif_id: params[:gif_id]).delete
    redirect_to user_favorite_gifs_path(current_user)
  end

  private
  def favorite_params
    params.permit(:gif_id, :user_id)
  end
end
