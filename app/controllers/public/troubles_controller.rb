class Public::TroublesController < ApplicationController
  before_action :authenticate_customer!,except: [:show]
  def index
    @troubles = Trouble.all
  end


  def show
    @trouble = Trouble.find(params[:id])
    @items = @trouble.items

  end
end
