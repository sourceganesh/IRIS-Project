class AddNewbidToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :newbid, :integer
  end
end
