require "http"
require "json"

class NasaApiService
  API_URL = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos"
  API_KEY = ENV["NASA_API_KEY"]

  def fetch_mars_photos
    response = HTTP.get("#{API_URL}?sol=1000&api_key=#{API_KEY}")

    photos = JSON.parse(response.body.to_s)
    photos["photos"].each do |photo_data|
      camera = photo_data["camera"]
      name = photo_data["rover"]&.[]("name")
      date = photo_data["earth_date"]
      img_src = photo_data["img_src"]

      MarsPhoto.create!(name: name,
      img_src: img_src,
      date: date)
    end
  end

  def fetch_mars_photos_by_sol(sol)
    response = HTTP.get("#{API_URL}?sol=#{sol}&api_key=#{API_KEY}")
    return [] unless response.status.success?
    photos = JSON.parse(response.body.to_s)
    photos["photos"].map do |photo_data|
      camera = photo_data["camera"]
      name = photo_data["rover"]&.[]("name")
      date = photo_data["earth_date"]
      img_src = photo_data["img_src"]

      MarsPhoto.create!(name: name,
      img_src: img_src,
      date: date)
    end.compact
  end

  def fetch__random_photo
    sol = rand(5000)
    photos = fetch_mars_photos_by_sol(sol)
    photos.first
  end
end
