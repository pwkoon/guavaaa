class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.all
    @review = Review.new
    @reviews = Review.all
  end

  def show
    @products = Product.all
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
