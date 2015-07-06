class OffersController < ApplicationController

  before_filter :authenticate_user!

  before_filter :set_offer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @offers = Offer.all
    respond_with(@offers)
  end

  def show
    respond_with(@offer)
  end

  def new
    @offer = Offer.new
    respond_with(@offer)
  end

  def edit
  end

  def create
    @offer = Offer.new(params[:offer])
    @offer.product_ids = params[:product_ids]

    @offer.save
    respond_with(@offer)
  end

  def update
    @offer.update_attributes(params[:offer])
    @offer.products.each{|p| @offer.products.delete(p) }
    @offer.product_ids = params[:product_ids]

    respond_with(@offer)
  end

  def destroy
    @offer.destroy
    respond_with(@offer)
  end

  private
  def set_offer
    @offer = Offer.find(params[:id])
  end
end
