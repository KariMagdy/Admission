class RemoveExtraActivitiesFromApplicant < ActiveRecord::Migration
  def up
    remove_column :applicants, :extra_activities
      end

  def down
    add_column :applicants, :extra_activities, :Text
  end
end
