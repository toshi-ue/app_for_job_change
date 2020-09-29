class TodaysmenusController < ApplicationController
  before_action :authenticate_user!
  def index
    @todaysmenus = current_user.todaysmenus.includes(:cuisine)
  end

  def update
    @todaysmenu = Todaysmenu.find_by(id: params)
    @todaysmenu.update(todaysmenu_params)
  end

  def destroy
    @todaysmenu = Todaysmenu.find_by(params[:id])
    @todaysmenu.destroy
    redirect_to todaysmenus_path, flash: { notice: "#{@todaysmenu.cuisine.name}を削除しました"}
  end

  private
  def todaysmenu_params
    params.permit(:todaysmenu).require(:cuisine_id, :user_id, :serving_count)
  end
end
