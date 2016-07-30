class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @expenses = Expense.all
  end

  def create
    expense = Expense.new expense_params
    if expense.save
      redirect_to root_path, notice: "Created successfully"
    else
      redirect_to root_path, alert: "Error creating expense"
    end
  end

  def update
    expense = Expense.find(params[:id])
    if expense.update expense_params
      redirect_to root_path, notice: "Update successfully"
    else
      redirect_to root_path, alert: "Error updating expense"
    end
  end

  private
  def expense_params
    params.require(:expense).permit(:description, :value)
  end
end
