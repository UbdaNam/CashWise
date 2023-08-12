class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def new
    @expense = Expense.new
    @categories = current_user.categories
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.author = current_user
    if @expense.save
      redirect_to @expense.categories.first, notice: 'Transaction created successfully'
    else
      @categories = current_user.categories
      render :new, status: :unprocessable_entity
    end
  end
  
  private

  def expense_params
    params.require(:expense).permit(:name, :amount, category_ids: [])
  end
end
