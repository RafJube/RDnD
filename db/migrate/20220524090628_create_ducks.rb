class CreateDucks < ActiveRecord::Migration[6.1]
  def change
    create_table :ducks do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.decimal :average_rating
      t.string :languages, array: true, default: []

      t.timestamps
    end
  end
end
