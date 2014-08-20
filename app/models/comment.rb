class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :place
	after_create :send_comment_email

	RATINGS = {
		'one star' => 1,
		'two stars' => 2,
		'three stars' => 3,
		'four stars' => 4,
		'five stars' => 5
	}

	def humanized_rating
		RATINGS.invert[self.rating]
	end

	def send_comment_email
		if self.user && self.place.user
			NotificationMailer.comment_added(self).deliver	
		end
	end
end
