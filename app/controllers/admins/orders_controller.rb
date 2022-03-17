class Admins::OrdersController < ApplicationController
    before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_details
  end
    def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
    redirect_to admins_order_path(@order.id)
    else
      render 'edit'
    end
    end

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status, :created_at, :updated_at)
  end
end

