class AddBidactToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :active, :boolean, default: true
    add_column :items, :bid_id, :integer
  end
end
