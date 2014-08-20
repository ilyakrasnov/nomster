class Place < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :photos
	
	geocoded_by :address
	after_validation :geocode

	validates :name, :presence => true, :length => {minimum: 3}
	validates :address, :presence => true
	validates :description, :presence => true

	def average_rating
		ratings = []
		comments.each do |c| 
			ratings << c.rating.to_i
		end	
		average = ratings.sum.to_f/ratings.length
	end

	def to_s
		"#{self.name}, #{self.address}"
	end
end
