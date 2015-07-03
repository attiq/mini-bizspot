class BusinessesController < ApplicationController

  before_filter :authenticate_user!

  before_filter :set_business, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @businesses = current_user.businesses
    respond_with(@businesses)
  end

  def show
    respond_with(@business)
  end

  def new
    @business = Business.new
    respond_with(@business)
  end

  def edit
  end

  def create
    @business = Business.new(params[:business])
    @business.save
    respond_with(@business)
  end

  def update
    @business.update_attributes(params[:business])
    respond_with(@business)
  end

  def destroy
    @business.destroy
    respond_with(@business)
  end

  private
  def set_business
    @business = Business.find(params[:id])
  end
end
