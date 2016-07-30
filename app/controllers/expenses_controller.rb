class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @expenses = Expense.all
  end

  def create
    expense = Expense.new params.require(:expense).permit(:value, :description)
    if expense.save
      redirect_to root_path, notice: "Created successfully"
    else
      redirect_to root_path, alert: "Error creating expense"
    end
  end
end
