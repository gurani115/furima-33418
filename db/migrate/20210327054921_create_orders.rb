class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :postal_code, null: false
      t.integer :region_id, null: false
      t.string :town, null: false
      t.string :numbering, null: false
      t.string :building
      t.string :telephone, null: false
      t.references :purchase,  foreign_key: true
      t.timestamps
    end
  end
end
