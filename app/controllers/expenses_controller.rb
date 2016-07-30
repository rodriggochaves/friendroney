class ExpensesController < ApplicationController
  def new
    @expenses = Expense.all
  end

  def create
    expense = Expense.new params.permit(:value, :description)
    if expense.save
      redirect_to root_path, notice: "Created successfully"
    else
      redirect_to root_path, alert: "Error creating expense"
    end
  end
end
