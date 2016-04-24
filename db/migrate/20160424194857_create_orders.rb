class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :period
      t.integer :demand

      t.timestamps null: false
    end
  end
end
