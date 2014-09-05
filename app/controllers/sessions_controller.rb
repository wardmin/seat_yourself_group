class SessionsController < ApplicationController
  def new
  end

  def create
  	restaurant = Restaurant.find_by(email: params[:email])
    if restaurant && restaurant.authenticate(params[:password])
      session[:restaurant_id] = restaurant.id
      flash[:notice] = "You are logged in to OmNom.com!"
      redirect_to root_url
    elsif customer = Customer.find_by(email: params[:email])
  	   if customer && customer.authenticate(params[:password])
    		session[:customer_id] = customer.id
    		flash[:notice] = "You are logged in to OmNom.com!"
    		redirect_to root_url
      end
  	else
  		flash[:alert] = "You have entered an invalid email or password."
  		render "new"
    end
  end

  def destroy
  	session[:customer_id] = nil
    session[:restaurant_id] = nil
  	redirect_to restaurants_path, notice: "You have logged out of OmNom.com."
  end
end
