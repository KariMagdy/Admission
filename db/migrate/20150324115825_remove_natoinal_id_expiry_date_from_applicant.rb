class RemoveNatoinalIdExpiryDateFromApplicant < ActiveRecord::Migration
  def up
    remove_column :applicants, :national_id_expiry_date
      end

  def down
    add_column :applicants, :national_id_expiry_date, :Text
  end
end
