class ReservationsController < ApplicationController
	
	def create
		@reservation = Reservation.new(reservation_params)
		@reservation.customer = @current_user
		@reservation.restaurant = Restaurant.find(params[:reservation[:restaurant_id]])

		if @reservation.save
			redirect_to customer_path(@current_user), notice: "Reservation successful."
		else
			render 'restaurants/show', alert: "Something went wrong!!"
		end
	end

	private

	def reservation_params
		params.require(:reservation).permit(:party_size, :start_date_time, :end_date_time)
	end
end
