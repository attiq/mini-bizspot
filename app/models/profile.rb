class Profile < ActiveRecord::Base
  attr_accessible :address, :phone, :user_id, :start_at, :end_at, :first_name, :last_name

  belongs_to :user

end
