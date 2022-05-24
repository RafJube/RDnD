class RenameLanguagesToDucks < ActiveRecord::Migration[6.1]
  def change
    rename_column :ducks, :languages, :skills
  end
end
