class DeleteAttachmentFromRestaurant < ActiveRecord::Migration
  def change
    remove_column :restaurants, :attachment
  end
end
