class Product < ActiveRecord::Base

  attr_accessible :business_id, :name, :price, :asset, :asset_attributes

  belongs_to :business
  has_one :asset, :as => :owner, :dependent => :destroy
  has_and_belongs_to_many :offers

  accepts_nested_attributes_for :asset, :allow_destroy => true

end
