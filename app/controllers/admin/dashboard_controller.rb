class Admin::DashboardController < ApplicationController
  # Display a count of how many products are in the database
  # Display a count of how many categories are in the database
  # def show
  #   @product = Product.count
  #   @category = Category.count
  # end

  def show
    @products = Product.count
    @categories = Category.count
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end


end
