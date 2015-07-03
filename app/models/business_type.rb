class BusinessType < ActiveRecord::Base
  attr_accessible :name
  has_many :businesses
end
