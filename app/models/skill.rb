class Skill < ApplicationRecord
  has_many :duck_skills, dependent: :destroy
  validates :name, presence: true
end
