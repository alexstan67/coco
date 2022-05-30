class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true
      t.float :total_price, null: false
      t.text :comment
      t.datetime :teaching_date, null: false
      t.integer :duration_min, null: false

      t.timestamps
    end
  end
end
