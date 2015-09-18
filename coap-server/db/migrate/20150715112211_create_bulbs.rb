class CreateBulbs < ActiveRecord::Migration
  def change
    create_table :bulbs do |t|
      t.string :color
      t.boolean :on
      t.integer :brightness

      t.timestamps null: false
    end
  end
end
