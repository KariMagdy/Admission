class RemoveAcademicHonoursFromApplicant < ActiveRecord::Migration
  def up
    remove_column :applicants, :academic_honours
      end

  def down
    add_column :applicants, :academic_honours, :Text
  end
end
