class Skill < ApplicationRecord
  include PgSearch::Model
  # multisearchable against: :name
  pg_search_scope :search_by_name,
  against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }
  has_many :duck_skills, dependent: :destroy
  has_many :ducks, through: :duck_skills
  validates :name, presence: true
end
