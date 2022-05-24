class Duck < ApplicationRecord
  has_many :rentals
  has_many :favorites, dependent: :destroy
  has_many :users, through: :rentals
  has_many :duck_skills, dependent: :destroy
  has_many :skills, through: :duck_skills
  belongs_to :user
  validates :name, presence: true, length: { minimum: 3 }
  validates :price, presence: true
  validates :description, presence: true, length: { maximum: 1000,
    too_long: "%{count} characters is the maximum allowed" }
end
