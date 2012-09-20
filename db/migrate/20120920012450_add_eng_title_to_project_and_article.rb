class AddEngTitleToProjectAndArticle < ActiveRecord::Migration
  def change
    add_column :projects, :eng_title, :string
    add_column :articles, :eng_title, :string
    add_index :projects, :eng_title
    add_index :articles, :eng_title
  end
end
