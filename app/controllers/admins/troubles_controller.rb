class Admins::TroublesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @troubles = Trouble.all
    @trouble = Trouble.new
  end


  def create
    @trouble = Trouble.new(trouble_params)
   if @trouble.save
    redirect_to admins_troubles_path
   else
     redirect_to admins_troubles_path
   end
  end

  def edit
  @trouble = Trouble.find(params[:id])

  end

    def update
    @trouble = Trouble.find(params[:id])
    if @trouble.update(trouble_params)
    redirect_to admins_troubles_path
    else
      render 'edit'
    end
    end
    def trouble_params
     params.require(:trouble).permit(:name)
    end

end
