class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable, :trackable
  has_many :favorites, dependent: :destroy, inverse_of: :user
  has_many :todaysmenus, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :cuisines, through: :todaysmenus
  validates :nickname, length: { in: 1..30 }, if: -> { validation_context == :update_profile }
  validates :default_serving_count, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }, if: -> { validation_context == :update_profile }
  mount_uploader :profile_image, ProfileImageUploader

  def already_favorite?(cuisine)
    self.favorites.exists?(cuisine_id: cuisine.id)
  end

  def already_menu_in_today?(cuisine_id)
    self.todaysmenus.exists?(cuisine_id: cuisine_id, created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end

  def join_subscription
    self.subscribed = true
    self.subscribed_at = Time.zone.now
    self.save
  end

  def stop_subscription
    self.subscribed = false
    self.subscribed_at = nil
    self.save
  end
end
