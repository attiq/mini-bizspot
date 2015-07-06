class Offer < ActiveRecord::Base
  attr_accessible :user_id, :end_at, :price, :start_at, :asset, :asset_attributes

  belongs_to :user
  has_one :asset, :as => :owner, :dependent => :destroy
  has_and_belongs_to_many :products

  accepts_nested_attributes_for :asset, :allow_destroy => true

end
