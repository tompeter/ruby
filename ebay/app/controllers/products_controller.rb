class ProductsController < ApplicationController
  def index
    @products = Product.order('created_at DESC').page(params[:page]).per(20)
  end

  def search
    if params[:term].present?
      @products = Product.where('product_name LIKE ?', "%#{params[:term]}%").page(params[:page]).per(20)
    else
      render partial: 'products/searchajax'
    end
    render partial: 'products/searchajax'
  end

  def show
      @product = Product.find(params[:id])
  end
  
  private
  def product_params
    params.require(:product).permit(:product_name, :product_details, :product_no, :avatar)
  end
end
