class AddLanguageImageToLessons < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :language_image, :string
  end
end
