class FavoritesController < ApplicationController
  before_action :authenticate_user!

  # TODO: セレクトボックスでソート機能を実装するか検討
  def index
    @favorites = current_user.favorites
  end

  # FIXME: あとでAjaxにする
  def create
    @cuisine = Cuisine.find_by(id: params[:cuisine_id])
    @favorite = current_user.favorites.create(cuisine_id: params[:cuisine_id])
  end

  def destroy
    @cuisine = Cuisine.find_by(id: params[:cuisine_id])
    @favorite = current_user.favorites.find_by(cuisine_id: params[:cuisine_id])
    @favorite.destroy
  end
end
