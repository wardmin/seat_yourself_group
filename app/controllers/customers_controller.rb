class CustomersController < ApplicationController
	before_action :load_customer, only: [:show, :edit, :update, :destroy]
	 
	 def new
	  	@customer = Customer.new
	 end

	 def create
	  	@customer = Customer.new(customer_params)
	  	if @customer.save
	  		redirect_to customer_url(@customer)
	  	else
	  		render :new
	  	end
	 end

	 def show
	 end

	 def edit
	 end

	 def update
	 	
	 end

	 private
	 def customer_params
	 	params.require(:customer).permit(:email, :name, :password, :password_confirmation)
	 end

	 def load_customer
	 	@customer = Customer.find(params[:id])
	 end
end
