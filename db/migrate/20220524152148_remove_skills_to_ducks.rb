class RemoveSkillsToDucks < ActiveRecord::Migration[6.1]
  def change
    remove_column :ducks, :skills
  end
end
