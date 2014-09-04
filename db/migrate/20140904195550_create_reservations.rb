class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :date_time
      t.references :customer, index: true
      t.references :restaurant, index: true
      t.integer :party_size

      t.timestamps
    end
  end
end
