class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories.left_outer_joins(:expenses).select('categories.*, SUM(expenses.amount) AS total_amount').group('categories.id')
  end

  def show
    @category = Category.find(params[:id])
    @expenses = @category.ordered_by_recent
    @total_amount = @expenses.sum(:amount) || 0
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.author = current_user
    if @category.save
      redirect_to categories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
