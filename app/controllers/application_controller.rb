class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource_or_scope)
    if current_user.present? and current_user.business_owner?
      businesses_path
    elsif current_user.present? and current_user.customer?
      "/home/customer_dashboard"
    else
      root_url
    end
  end

end
