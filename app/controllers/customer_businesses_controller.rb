class CustomerBusinessesController < ApplicationController

  before_filter :authenticate_user!

  def index
    @businesses = Business.all
  end

end
