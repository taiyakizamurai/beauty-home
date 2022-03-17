class Public::ItemsController < ApplicationController
      before_action :authenticate_customer!,except: [:index, :search]
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_items = CartItem.new
    if @item.is_active == 1
    elsif
      @item.is_active == 2
    else
      redirect_to items_path
    end



  end

def search
  @items = Item.search(params[:keyword])
  @keyword = params[:keyword]
  render "index"
end
end
