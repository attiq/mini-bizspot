# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "Deleting existing roles..."
roles = Role.all
roles.each { |role| role.destroy } if roles.present?

puts "Creating roles..."
%w(business_owner customer).each do |name|
  Role.create!(:name => name)
end

puts "Deleting existing users.."
users = User.all
users.each { |user| user.destroy } if users.present?

puts "Creating default bussiness owner ...."
owner = User.new(:email => "business_owner@minibiz.com",
                 :password => "12345678",
                 :password_confirmation => "12345678",
                 :profile => Profile.new(:first_name => "Busioness",
                                         :last_name => "Owner",
                                         :start_at => Time.now,
                                         :end_at => Time.now + 8.hours,
                                         :address => "Siddiq Trade Center",
                                         :phone => "8889907469")
)
owner.roles << Role.find_by_name("business_owner")
owner.skip_confirmation!
owner.save!

puts "Creating default customer ...."
customer = User.new(:email => "customer@minibiz.com",
                    :password => "12345678",
                    :password_confirmation => "12345678",
                    :profile => Profile.new(:first_name => "Busioness",
                                            :last_name => "Customer",
                                            :start_at => Time.now,
                                            :end_at => Time.now + 8.hours,
                                            :address => "Siddiq Trade Center",
                                            :phone => "8889907469")
)
customer.roles << Role.find_by_name("customer")
customer.skip_confirmation!
customer.save!

puts "Deleting existing business types.."
business_types = BusinessType.all
business_types.each { |business_type| business_type.destroy } if business_types.present?

puts "Creating default business types...."
%w(creativity energy focus pain_relief relax happy).each do |name|
  BusinessType.create!(:name => name)
end