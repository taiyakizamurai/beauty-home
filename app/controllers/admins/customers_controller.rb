class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
   if @customer.update(customer_params)
    redirect_to admins_customers_path
   else
    render 'edit'
   end

  end

  def unsubcribe
    @customer = Customer.find(params[:id])
     @customer.destroy
    redirect_to Customer_path
  end

      private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
  end
end


