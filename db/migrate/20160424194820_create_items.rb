class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :code
      t.integer :demand
      t.string :description
      t.integer :units

      t.timestamps null: false
    end
  end
end
