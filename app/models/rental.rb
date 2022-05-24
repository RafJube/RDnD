class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :duck
  validates :date_start, presence: true #, comparison: { greater_than: :end_date }
  validates :date_end, presence: true #, comparison: { less_than: :end_date }
end
