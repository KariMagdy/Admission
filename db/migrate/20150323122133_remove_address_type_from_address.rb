class RemoveAddressTypeFromAddress < ActiveRecord::Migration
  def up
    remove_column :addresses, :address_type
      end

  def down
    add_column :addresses, :address_type, :Text
  end
end
