class CreateReadings < ActiveRecord::Migration[8.1]
  def change
    create_table :readings do |t|
      t.text :note
      t.references :book, null: false, foreign_key: true
      t.references :reading_list, null: false, foreign_key: true

      t.timestamps
    end
    add_index :readings, [:book_id, :reading_list_id], unique: true
  end
end
