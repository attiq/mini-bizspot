class ProductsController < ApplicationController

  before_filter :authenticate_user!

  before_filter :set_product, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @business = Business.find_by_id(params[:business_id])
    @products = @business.products

    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def new
    @business = Business.find_by_id(params[:business_id])
    @product = Product.new
    respond_with(@product)
  end

  def edit
    @business = Business.find_by_id(params[:business_id])
  end

  def create
    @product = Product.new(params[:product])
    @product.save
    respond_with(@product)
  end

  def update
    @product.update_attributes(params[:product])
    respond_with(@product)
  end

  def destroy
    @business = Business.find_by_id(params[:business_id])
    @product.destroy
    redirect_to products_path(:business_id => @business.id)
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end
end
