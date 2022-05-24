class Duck < ApplicationRecord
  has_many :rentals
  has_many :favorites, dependent: :destroy
  has_many :users, through: :rentals
  belongs_to :user
end
