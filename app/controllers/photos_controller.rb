class PhotosController < ApplicationController
	def create
		@place = Place.find(params[:place_id])
		@place.photos.create(photos_params)
		redirect_to place_path(@place)
	end

	def photo_params
		params.require(:photo).permit(:caption, :picture)
	end
end
