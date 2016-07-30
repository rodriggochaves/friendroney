class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @expenses = Expense.all
    @expenses = @expenses.sort_by{ |result| result.updated_at}.reverse
    @balance = 0 + @expenses.map{ |e| e.value }.inject(:-).to_i
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

  def destroy
    expense = Expense.find(params[:id])
    expense.destroy
    redirect_to root_path
  end

  private
  def expense_params
    params.require(:expense).permit(:description, :value)
  end
end
