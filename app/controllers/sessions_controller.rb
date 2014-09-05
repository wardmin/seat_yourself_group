class SessionsController < ApplicationController
  def new
  end

  def create
  	customer = Customer.find_by(email: params[:id])
  	if customer && customer.authenticate(params[password])
  		session[:customer_id] = customer_id
  		flash [:notice] = "You are logged in to OmNom.com!"
  		redirect_to restaurants_url
  	else
  		flash [:alert] = "You have entered an invalid email or password."
  		render "new"
  end

  def destroy
  	session[:customer_id] = nil
  	redirect_to restaurants_url, notice: "You have logged out of OmNom.com."
  end
end
