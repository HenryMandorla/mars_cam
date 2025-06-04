class CreateMarsPhotos < ActiveRecord::Migration[8.0]
  def change
    create_table :mars_photos do |t|
      t.string :name
      t.date :date
      t.string :img_src

      t.timestamps
    end
  end
end
