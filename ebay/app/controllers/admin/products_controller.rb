module Admin
  class ProductsController < AdminController 
    def index
      @products = Product.order('created_at DESC').page(params[:page]).per(13)
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to admin_products_path
      else
        render 'new'
      end
    end

    def search
      if params[:term].present?
        @products = Product.where('product_name LIKE ?', "%#{params[:term]}%").page(params[:page]).per(20)
       else
        render partial: 'admin/searchajaxadmin'
      end
      render partial: 'admin/searchajaxadmin'
    end

    def show
      @product = Product.find(params[:id])
    end

    def edit
      @product = Product.find(params[:id])
    end

    def destroy
      Product.find(params[:id]).destroy
    end

    def update
      @product = Product.find(params[:id])
      if @product.update_attributes(product_params)
        redirect_to admin_product_path(@product)
      else
        render 'edit'
      end
    end

    private
    def product_params
      params.require(:product).permit(:product_name, :product_details, :product_no, :category_id, :brand_id, :avatar)
    end
  end
end
