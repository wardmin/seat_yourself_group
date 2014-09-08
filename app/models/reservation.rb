class Reservation < ActiveRecord::Base
 	belongs_to :customer
 	belongs_to :restaurant

	validates :customer_id, presence: true
	validates :restaurant_id, presence: true
	validates :party_size, presence: true, numericality: { only_integer: true }
	validates :start_date_time, presence: true
	validate :availability

	private
	  def availability
	  	unless restaurant.available?(party_size, start_date_time)
	  		errors[:base] << "Not enough spaces available at that time."
	  	end
	end
end
