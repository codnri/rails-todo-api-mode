class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :subject
      t.text :description
      t.boolean :is_completed

      t.timestamps
    end
  end
end
