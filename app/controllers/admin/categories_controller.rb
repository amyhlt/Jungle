class Admin::CategoriesController < ApplicationController
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"],password: ENV["HTTP_BASIC_PASSWORD"], except: [:index]
  
  def index
    @category = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    
       @category = Category.new(category_params)
      
      @exist=Category.exists?(name:@category.name)
      if @exist
        flash.now[:error]= "This category already exists."
        render 'new'
      elsif  @category.save
             redirect_to [:admin, :categories], notice: ' category created!'
      else
      render :new
      end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to [:admin, :categories], notice: 'Category deleted!'
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
     
    )
  end

end
