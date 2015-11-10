module Admin    
  class CategoriesController < AdminController
    def index
      @categories = Category.order(:name).page(params[:page]).per(07)
    end

    def new
      @category  = Category.new
    end

    def create
      @category = Category.new(categories_params)
      if @category.save
        redirect_to admin_categories_path
      else
        render 'new'
      end
    end

    def show
      @category = Category.find(params[:id])
    end

    def edit
      @category = Category.find(params[:id])
    end

    def destroy
      Category.find(params[:id]).destroy
    end

    def update
      @category = Category.find(params[:id])
      if @category.update_attributes(categories_params)
        redirect_to admin_categories_path(@category)
      else
        render 'edit'
      end
    end

    private
    def categories_params
      params.require(:category).permit(:name)
    end
  end
end
