class AddClaimToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :claim, :boolean, default: false
  end
end
