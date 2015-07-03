class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.datetime :start_at
      t.datetime :end_at
      t.text :address
      t.text :phone

      t.timestamps
    end
  end
end
