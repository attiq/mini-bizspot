class HomeController < ApplicationController

  before_filter :check_user

  def products
    @products = Product.all
  end

  def offers
    @offers = Offer.all
  end

  def check_user
    if current_user.present? and current_user.business_owner?
      businesses_path
    elsif current_user.present? and current_user.customer?
      customer_businesses_path
    end
  end

end
