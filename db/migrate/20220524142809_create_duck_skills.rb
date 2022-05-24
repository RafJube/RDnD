class CreateDuckSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :duck_skills do |t|
      t.references :duck, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
