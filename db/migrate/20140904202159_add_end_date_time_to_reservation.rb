class AddEndDateTimeToReservation < ActiveRecord::Migration
  def change
  	add_column :reservations, :end_date_time, :datetime
  	add_column :reservations, :start_date_time, :datetime

  	remove_column :reservations, :date_time
  end
end
