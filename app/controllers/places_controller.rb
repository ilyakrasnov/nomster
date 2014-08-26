class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

	def index
		@places = Place.all.page(params[:page]).per(25)
	end

	def new
		@place = Place.new
	end

	def create
		@place = current_user.places.create(place_params)
		if @place.valid?
			redirect_to root_path
		else
			render :new, :status => :unprocessable_entity
		end
	end

	def show
		@place = Place.find(params[:id])
		raise ActiveRecord::RecordNotFound if @place.nil?

		@comment = Comment.new
		@photo = Photo.new
	end

	rescue_from ActiveRecord::RecordNotFound do
			render file: 'public/404', status: 404, formats: [:html]
	end

	# def not_found # raise ActionController::RoutingError.new('Not Found')
	# end

	def edit
		@place = Place.find(params[:id])

		if @place.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden
		end
	end

	def update
		@place = Place.find(params[:id])

		if @place.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden
		end

		@place.update_attributes(place_params)
		if @place.valid?
			redirect_to root_path
		else
			render :edit, :status => :unprocessable_entity
		end
	end

	def destroy
		@place = Place.find(params[:id])
		
		if @place.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden
		end

		@place.destroy
		redirect_to root_path
	end


	private

	def place_params
		params.require(:place).permit(:name,:address,:description)
	end
end
