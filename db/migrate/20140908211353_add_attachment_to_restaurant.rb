class AddAttachmentToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :attachment, :string
  end
end
