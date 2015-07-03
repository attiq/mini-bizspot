class Business < ActiveRecord::Base
  attr_accessible :address, :business_type_id, :description, :latitude, :longitude, :name, :tag_line, :user_id
  belongs_to :user
  belongs_to :business_type
  has_many :products

end
