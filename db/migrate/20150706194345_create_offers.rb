class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :user_id
      t.datetime :start_at
      t.datetime :end_at
      t.float :price

      t.timestamps
    end

    create_table :offers_products, :id => false do |t|
      t.integer :offer_id
      t.integer :product_id
    end

  end
end
