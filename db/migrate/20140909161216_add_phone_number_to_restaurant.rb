class AddPhoneNumberToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :area_code, :string
    add_column :restaurants, :phone_prefix, :string
    add_column :restaurants, :phone_suffix, :string
  end
end
