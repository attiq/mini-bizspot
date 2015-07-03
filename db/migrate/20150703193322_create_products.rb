class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :business_id
      t.string :name
      t.float :price

      t.timestamps
    end
  end
end
