class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
  end

  def create
  end
end
