class DropWorksTable < ActiveRecord::Migration
  def up
		drop_table :works
  end

  def down
		drop_table :products
  end
end
