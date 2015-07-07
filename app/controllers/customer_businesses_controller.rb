class CustomerBusinessesController < ApplicationController

  before_filter :authenticate_user!

  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find(params[:id])
  end

end