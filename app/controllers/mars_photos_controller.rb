class MarsPhotosController < ApplicationController
  def index
    service = NasaApiService.new
    @photo = MarsPhoto.order(created_at: :desc).first
    @random = service.fetch__random_photo
  end

  def search
    sol_param = params[:sol]
    if sol_param.present?
      service = NasaApiService.new
      photos = service.fetch_mars_photos_by_sol(params[:sol].to_i)
      @photo = photos.first
    end
  end
end
