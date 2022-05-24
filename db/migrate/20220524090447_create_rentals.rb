class CreateRentals < ActiveRecord::Migration[6.1]
  def change
    create_table :rentals do |t|
      t.decimal :rating
      t.datetime :date_start
      t.datetime :date_end
      t.text :comments

      t.timestamps
    end
  end
end
