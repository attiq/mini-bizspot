class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :role_name
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_name, :profile, :profile_attributes
  # attr_accessible :title, :body


  after_create :set_role


  has_and_belongs_to_many :roles
  has_one :profile
  has_many :businesses

  accepts_nested_attributes_for :profile, :allow_destroy => true, :update_only => true

  def role
    return "business owner" if business_owner?
    return "customer" if customer?
  end

  def business_owner?
    roles.include?(Role.find_by_name("business_owner"))
  end

  def customer?
    roles.include?(Role.find_by_name("customer"))
  end

  private

  def set_role
    self.roles << Role.find_by_name(self.role_name) if self.role_name.present?
  end

end
