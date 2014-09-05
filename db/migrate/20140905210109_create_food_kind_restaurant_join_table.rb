class CreateFoodKindRestaurantJoinTable < ActiveRecord::Migration
  def change
  	create_join_table :restaurants, :food_types
  end
end
