class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params_product)

    if @product.save
        redirect_to  product_path(@product)
    else
        render :new, status: :unprocessable_entity
    end
  end

  private

  def params_product
    params.require(:product).permit(:name, :description, :price, :photo)
  end
end
