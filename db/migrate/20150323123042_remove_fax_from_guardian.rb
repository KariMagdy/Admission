class RemoveFaxFromGuardian < ActiveRecord::Migration
  def up
    remove_column :guardians, :fax
      end

  def down
    add_column :guardians, :fax, :Text
  end
end
