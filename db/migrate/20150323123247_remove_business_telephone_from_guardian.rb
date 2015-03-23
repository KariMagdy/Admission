class RemoveBusinessTelephoneFromGuardian < ActiveRecord::Migration
  def up
    remove_column :guardians, :business_telephone
      end

  def down
    add_column :guardians, :business_telephone, :Text
  end
end
