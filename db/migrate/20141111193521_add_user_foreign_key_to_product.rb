class AddUserForeignKeyToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :user_id, :integer
  	Product.update_all user_id: User.first.id
  end
end

