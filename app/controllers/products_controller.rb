class ProductsController < ApplicationController

  helper_method :product_owner?
  
  before_action :ensure_logged_in, only: [:new, :create, :edit, :destroy]
  before_action :load_product, only: [:show, :edit, :update, :destroy]
  before_action :product_owner?, only: [:edit, :destroy, :update]

  def index
    @products = if params[:search]
      Product.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    else
  	 Product.all
    end
  end

  def show
  	#@product = Product.find(params[:id])

    if current_user
      @review = @product.reviews.build
    end
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = current_user.products.build(product_params)
  	if @product.save
  		redirect_to products_url
  	else
  		render :new
  	end
  end

  def edit
  	#@product = Product.find(params[:id])
  end

  def update
  	#@product = Product.find(params[:id])

  	if @product.update_attributes(product_params)
  		redirect_to products_url
  	else
  		render :edit
  	end
  end

  def destroy
  	#@product = Product.find(params[:id])
  	@product.delete
  	redirect_to products_url
  end

  private

  def product_owner?
    current_user == @product.user
  end

  def product_params
  	params.require(:product).permit(:name, :description, :price_in_cents, :category)
  end

  def load_product
    @product = Product.find(params[:id])
  end

end
