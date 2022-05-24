class AddUserReferenceToDucks < ActiveRecord::Migration[6.1]
  def change
    add_reference :ducks, :user, null: false, foreign_key: true
  end
end
