class CustomersController < ApplicationController
	before_action :load_customer, only: [:show, :edit, :update, :destroy]
	 
	 def new
	  	@customer = Customer.new
	 end

	 def create
	  	@customer = Customer.new(customer_params)
	  	if @customer.save
	  		session[:customer_id] = @customer.id
	  		redirect_to customer_path(@customer), notice: "Let's find some food!"
	  	else
	  		render :new, alert: "Something went wrong!!"
	  	end
	 end

	 def show
	 end

	 def edit
	 end

	 def update
	 	if @customer.update(customer_params)
	 		redirect_to customer_path(@customer), notice: "Information updated."
	 	else
	 		render :edit, alert: "Something went wrong!!"
	 	end
	 end

	 def destroy
	 	session[:customer_id] = nil
	 	@customer.destroy
	 	redirect_to root_path, notice: "Sad to see you go!"
	 	
	 end

	 private
	 def customer_params
	 	params.require(:customer).permit(:email, :name, :password, :password_confirmation)
	 end

	 def load_customer
	 	@customer = Customer.find(params[:id])
	 end
end
