class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.integer :project_id
      t.text :content, null: false
      t.string :title, null: false
      t.boolean :is_publish, default: false

      t.timestamps
    end
    add_index :articles, :user_id
    add_index :articles, :project_id
    add_index :articles, :is_publish
  end
end
