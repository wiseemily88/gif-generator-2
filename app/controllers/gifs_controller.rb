class GifsController < ApplicationController
  def index
    @gifs = Gif.all
  end

  def query
    @gifs = Gif.all
    @sorted_hash = Hash.new
    @gifs.each do |gif|
      category = gif.category.name
      @sorted_hash[category] = gif
    end
  end
end
