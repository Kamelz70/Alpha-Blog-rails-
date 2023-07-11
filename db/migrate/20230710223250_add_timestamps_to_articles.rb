class AddTimestampsToArticles < ActiveRecord::Migration[7.0]
  def change; end
  add_column :articles, :description, :text
end
