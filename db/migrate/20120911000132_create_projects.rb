class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.boolean :is_publish, :default => false

      t.timestamps
    end
    add_index :projects, :user_id
    add_index :projects, :is_publish
  end
end
