class Admins::MakersController < ApplicationController
  before_action :authenticate_admin!
def new
    @maker = Maker.new
end

def create
    @maker = Maker.new(maker_params)
   if @maker.save
    redirect_to admins_maker_path(@maker.id)
   else
     render 'new'
   end

end

  def index
    @makers = Maker.all
  end

  def show
    @maker = Maker.find(params[:id])
  end

  def edit
   @maker = Maker.find(params[:id])

  end

    def update
    @maker = Maker.find(params[:id])
    if @maker.update(maker_params)
    redirect_to admins_maker_path(@maker.id)
    else
      render 'edit'
    end
    end
private
    def maker_params
    params.require(:maker).permit(:name, :introduction, :image, :is_active)
    end
end
