class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable, :trackable

  has_many :favorites, dependent: :destroy, inverse_of: :user
  has_many :todaysmenus, dependent: :destroy
  # Ajaxで使用している自作メソッド
  def already_favorite?(cuisine)
    self.favorites.exists?(cuisine_id: cuisine.id)
  end

  def already_menu_in_today?(user_id, cuisine_id)
    todaysmenu = Todaysmenu.where(user_id: user_id, cuisine_id: cuisine_id, created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    if todaysmenu.blank?
      false
    else
      true
    end
  end
end
