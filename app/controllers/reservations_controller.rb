class ReservationsController < ApplicationController
	
	def create
		@reservation = Reservation.new(reservation_params)
		@reservation.customer = current_user

		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation.restaurant = @restaurant

		if @reservation.save
			redirect_to customer_path(current_user), notice: "Reservation successful."
		else
			flash.now[:alert] = "Something went wrong!!"
			render 'restaurants/show'
		end
	end

	def destroy
		reservation = Reservation.find(params[:id])
		reservation.destroy
		redirect_to customer_path(current_user), notice: "Reservation canceled."
	end

	private

	def reservation_params
		params.require(:reservation).permit(:party_size, :start_date_time, :end_date_time)
	end
end
