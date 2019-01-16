class AddTittleToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :tittle, :text 
  end
end
