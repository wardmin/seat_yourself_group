class SessionsController < ApplicationController
  def new
  end

  def create
  	customer = Customer.find_by(email: params[:email])
  	if customer && customer.authenticate(params[:password])
  		session[:customer_id] = customer.id
  		redirect_to restaurants_path, notice: "You are logged in to OmNom.com!"
  	else
  		flash.now[:alert] = "You have entered an invalid email or password."
  		render "new"
    end
  end

  def destroy
  	session[:customer_id] = nil
  	redirect_to restaurants_path, notice: "You have logged out of OmNom.com."
  end
end
