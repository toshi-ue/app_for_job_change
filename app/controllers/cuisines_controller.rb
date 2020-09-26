class CuisinesController < ApplicationController
  def show
    @cuisine = Cuisine.find(params[:id])
    @foodstuffs = Foodstuff.includes(:rawmaterial,{rawmaterial: :unit}).where(cuisine_id: @cuisine.id)
    # @genres
    @procedures = Procedure.where(cuisine_id: @cuisine.id)
  end

  # ajax化
  def add_menu
    binding.pry
    @todaysmenu = current_user.todaysmenus.build(cuisine_id: params[:cuisine_id])
    @todaysmenu.save
    @cuisine = Cuisine.find_by(id: params[:cuisine_id])
  end

  def remove_menu
    @todaysmenu = current_user.todaysmenus.where(cuisine_id: params[:cuisine_id], created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    binding.pry
    @todaysmenu.destroy
    @cuisine = Cuisine.find_by(id: params[:cuisine_id])
  end

  # ajaxの場合必要?
  #   当controllerで使用していない
  private
  def todaysmenu_params
    params.require(:todaysmenu).permit(:cuisine_id, :user_id)
  end
end
