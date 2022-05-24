class AddReferencesToRentals < ActiveRecord::Migration[6.1]
  def change
    add_reference :rentals, :duck, null: false, foreign_key: true
    add_reference :rentals, :user, null: false, foreign_key: true
  end
end
