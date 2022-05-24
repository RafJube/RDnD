class Duck < ApplicationRecord
  has_many :rentals
  has_many :favorites
  belongs_to :user
end
