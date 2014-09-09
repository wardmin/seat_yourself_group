class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :restaurant_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
