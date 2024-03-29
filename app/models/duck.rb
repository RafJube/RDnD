class Duck < ApplicationRecord
  include PgSearch::Model
  # multisearchable against: [:name, :price]

  pg_search_scope :global_search,
                  against: [ :name, :price ],
                  associated_against:
                  {
                    skills: :name,
                    user: :username
                  },
                  using:
                  {
                    tsearch: { prefix: true }
                    # :trigram
                  }
  # ignoring: :accents

  has_many :rentals
  has_many :favorites, dependent: :destroy
  has_many :duck_skills, dependent: :destroy
  has_many :skills, through: :duck_skills
  has_one_attached :photo
  belongs_to :user
  validates :name, presence: true, length: { minimum: 3 }
  validates :price, presence: true
  validates :description, presence: true, length: { maximum: 1000, too_long: "1000 characters max" }
end
