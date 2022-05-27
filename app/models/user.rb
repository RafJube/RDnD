class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include PgSearch::Model
  # multisearchable against: :username
  pg_search_scope :search_by_name,
  against: [ :username ],
    using: {
      tsearch: { prefix: true }
    }
  has_many :rentals
  has_many :favorites, dependent: :destroy
  has_many :ducks, dependent: :destroy
  # has_many :ducks, through: :rentals
  # has_many :ducks, through: :favorites

  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
