class RemoveFaxFromAddress < ActiveRecord::Migration
  def up
    remove_column :addresses, :fax
      end

  def down
    add_column :addresses, :fax, :Text
  end
end
