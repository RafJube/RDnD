class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rentals
  has_many :favorites, dependent: :destroy
  has_many :ducks, dependent: :destroy
  has_many :ducks, through: :rentals
  has_many :ducks, through: :favorites
  validates :username, presence: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true, format: { with: /^[a-z]\w*@\w+\.\w+$/i, message: "is not an email" }
  validates :address, presence: true
  validates :password, presence: true, length: { in: 6..20 }, confirmation: true, unless: { password.blank? }
end
