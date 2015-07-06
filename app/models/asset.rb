class Asset < ActiveRecord::Base

  belongs_to :owner, :polymorphic => true

  attr_accessible :owner_id, :owner_type, :avatar, :owner
  #has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100>"},
  #                  :default_url => "/images/:style/missing.png"
  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100>"}
                    # :path => ":attachment/:id/:style/:basename.:extension",
                    # :storage => :s3,
                    # :s3_credentials => {
                    #     :bucket => ENV['BUCKET_NAME'],
                    #     :access_key_id => ENV['ACCESS_ID'],
                    #     :secret_access_key => ENV['ACCESS_KEY']
                    # }
  do_not_validate_attachment_file_type :avatar

end
