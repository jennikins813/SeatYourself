class ReservationsController < ApplicationController
	before_filter :load_restaurant

	def index
	end
	#not sure if I need index here

	def show
		@reservation = Reservation.find(params[:id])
	end

	def create
		@reservation = @restaurant.reservation.build(reservation_params)
		@reservation.user_id = current_user.id

		if @reservation.save
			redirect_to restaurants_path, notice: "Reservation successfully made"
		else
			render :action => :show
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
	end

	private
	def reservation_params
		params.require(:reservation).permit(:party_size, :restaurant_id, :user_id)
	end

	def load_restaurant
		@restaurant = Restaurant.find(params[:restaurant_id])
	end
end
