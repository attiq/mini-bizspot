class BookingsController < ApplicationController

  before_filter :authenticate_user!

  before_filter :set_booking, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if current_user.business_owner?
      @bookings = Booking.where(:product_id => Product.where(:business_id => current_user.businesses.map(&:id)).map(&:id))
    else
      @bookings = current_user.bookings
    end
    @bookings = Booking.all
    respond_with(@bookings)
  end

  def show
    respond_with(@booking)
  end

  def new
    @product = Product.find_by_id(params[:product_id])
    @booking = Booking.new
    respond_with(@booking)
  end

  def edit
  end

  def create
    @booking = Booking.new(params[:booking])
    @booking.save
    respond_with(@booking)
  end

  def update
    @booking.update_attributes(params[:booking])
    respond_with(@booking)
  end

  def destroy
    @booking.destroy
    respond_with(@booking)
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end
end
