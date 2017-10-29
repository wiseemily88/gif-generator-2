require 'net/http'
require 'json'
require 'pry'

class ApiService

  def initialize(category)
    key = open('app/assets/.api_key').read()
    url = "https://api.giphy.com/v1/gifs/search?api_key=#{key}&q=#{category}&limit=5&offset=0&rating=G&lang=en"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @image_object= JSON.parse(response)

  end

  def parse_json
    @image_object["data"].map do |image|
      image["images"]["original"]["url"]
    end
  end

end
