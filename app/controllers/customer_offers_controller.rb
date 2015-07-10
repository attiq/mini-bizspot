class CustomerOffersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
  end

end
