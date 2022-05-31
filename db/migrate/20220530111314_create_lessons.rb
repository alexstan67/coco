class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.references :user, null: false, foreign_key: true
      t.float :hourly_prices, null: false
      t.string :coding_language, null: false
      t.text :description, null: true

      t.timestamps
    end
  end
end
