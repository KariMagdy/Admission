class RemoveBusinessAddressFromGuardian < ActiveRecord::Migration
  def up
    remove_column :guardians, :business_address
      end

  def down
    add_column :guardians, :business_address, :Text
  end
end
