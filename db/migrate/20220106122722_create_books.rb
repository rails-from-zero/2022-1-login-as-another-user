class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :image_path
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
