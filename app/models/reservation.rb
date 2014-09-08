class Reservation < ActiveRecord::Base
  belongs_to :customer
  belongs_to :restaurant

  validate :availability

  private
  def availability
  	unless restaurant.available?(party_size, start_time)
  		errors[:base] << "Not enough spaces available at that time."
  	end
  end
end
