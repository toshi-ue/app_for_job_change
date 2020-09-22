class FavoritesController < ApplicationController
  before_action :authenticate_user!

  # TODO: セレクトボックスでソート機能を実装したい
  def index
    @favorites = current_user.favorites
  end

  # TODO: あとでAjaxにする
  def create
    @favorite = current_user.favorites.create(cuisine_id: params[:cuisine_id])
    redirect_to cuisine_path(params[:cuisine_id])
  end

  def destroy
    @favorite = current_user.favorites.find_by(cuisine_id: params[:cuisine_id])
    @favorite.destroy
    redirect_to cuisine_path(params[:cuisine_id])
  end
end
