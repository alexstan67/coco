class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :rating, null: false
      t.references :booking, null: false, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
