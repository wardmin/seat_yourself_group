class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.belongs_to :restaurant
      t.string :menu_photo
      t.string :main_photo
      t.string :photo_2
      t.string :photo_3

      t.timestamps
    end
  end
end
