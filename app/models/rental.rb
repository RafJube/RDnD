class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :duck
  validates :date_start, :date_end, presence: true
  validate :date_end_after_date_start
  # validates :rating, numericality: true#, comparison: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  def date_end_after_date_start
    return if date_end.blank? || date_start.blank?

    if date_end < date_start
      errors.add(:date_end, "must be after the start date")
    end
  end

  def rental_available?(duck)
    @rentals = duck.rentals
    output = true
    @rentals.each do |rental|
      if rental.date_end > date_start && rental.date_start < date_start
        errors.add(:date_start, "Sorry, not available from #{rental.date_start.strftime("%d/%m/%Y")} to #{rental.date_end.strftime("%d/%m/%Y")}")
        output = false
      elsif rental.date_end > date_end && rental.date_start < date_end
        errors.add(:date_end, "Sorry, not available from #{rental.date_start.strftime("%d/%m/%Y")} to #{rental.date_end.strftime("%d/%m/%Y")}")
        output = false
      elsif rental.date_end <= date_end && rental.date_start >= date_start
        errors.add(:date_end, "Sorry, not available from #{rental.date_start.strftime("%d/%m/%Y")} to #{rental.date_end.strftime("%d/%m/%Y")}")
        output = false
      end
    end
    output
  end
end
