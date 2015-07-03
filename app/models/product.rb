class Product < ActiveRecord::Base

  attr_accessible :business_id, :name, :price

  belongs_to :business

end
