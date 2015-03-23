class RemoveMilitaryStatusFromApplicant < ActiveRecord::Migration
  def up
    remove_column :applicants, :military_status
      end

  def down
    add_column :applicants, :military_status, :Text
  end
end
