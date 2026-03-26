class CreateRooms < ActiveRecord::Migration[8.1]
  def change
    create_table :rooms do |t|
      t.integer :capacity
      t.float :daily_price
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
