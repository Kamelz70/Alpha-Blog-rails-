class MakingDescriptionNonNullable < ActiveRecord::Migration[7.0]
  def change
    change_column :articles, :description, :text, null: false
  end
end
