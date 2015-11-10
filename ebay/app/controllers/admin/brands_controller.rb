module Admin
  class BrandsController < AdminController
    def index
      @brands = Brand.order(:name).page(params[:page]).per(07)
    end

    def new
      @brand = Brand.new
    end

    def create
      @brand = Brand.new(brands_params)
      if @brand.save
        redirect_to admin_brands_path
      else
        render 'new'
      end
    end

    def show
      @brand = Brand.find(params[:id])
    end

    def edit
      @brand = Brand.find(params[:id])
    end

    def destroy
      Brand.find(params[:id]).destroy
    end

    def update
      @brand = Brand.find(params[:id])
      if @brand.update_attributes(brands_params)
        redirect_to admin_brands_path(@brand)
      else
        render 'edit'
      end
    end

    private
    def brands_params
      params.require(:brand).permit(:name)
    end
  end
end
