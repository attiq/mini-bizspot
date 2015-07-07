class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :product_id
      t.datetime :start_at
      t.datetime :end_at
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
