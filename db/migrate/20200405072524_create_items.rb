class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.integer :bid
      t.datetime :deadline
      t.integer :contact
      t.references :user
      t.timestamps
    end
  end
end
