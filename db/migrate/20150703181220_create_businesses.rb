class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.integer :user_id
      t.integer :business_type_id
      t.text :description
      t.text :address
      t.text :tag_line
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
