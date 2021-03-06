class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to products_path
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory.to_i > 0
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end
