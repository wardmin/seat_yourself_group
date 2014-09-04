class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :capacity
      t.string :address
      t.string :city
      t.string :province
      t.string :postal_code
      t.integer :phone_number

      t.timestamps
    end
  end
end
