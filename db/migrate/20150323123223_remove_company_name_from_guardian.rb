class RemoveCompanyNameFromGuardian < ActiveRecord::Migration
  def up
    remove_column :guardians, :company_name
      end

  def down
    add_column :guardians, :company_name, :Text
  end
end
