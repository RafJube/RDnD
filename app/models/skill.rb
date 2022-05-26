class Skill < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name,
  against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }
  has_many :duck_skills, dependent: :destroy
  validates :name, presence: true
end
