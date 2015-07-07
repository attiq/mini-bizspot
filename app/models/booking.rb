class Booking < ActiveRecord::Base
  attr_accessible :description, :end_at, :product_id, :start_at, :user_id, :status

  belongs_to :user
  belongs_to :product

end
