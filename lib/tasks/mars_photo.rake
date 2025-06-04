namespace :mars do
  desc "Fetch and save today's Mars photo"

  task fetch_daily: :environment do
    puts "Fetching daily Mars photo"

    sol = rand(6000)
    service = NasaApiService.new
    photos = service.fetch_mars_photos_by_sol(sol)

    if photos.any?
      puts "Photos fetched!"
    else
      puts "No photos found."
    end
  end
end
