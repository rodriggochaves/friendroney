class ExpensesController < ApplicationController
  before_action :calculate_total, only: [:index, :new]

  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
    @expenses = Expense.imcompletes
  end

  def create
    expense = Expense.new expense_params
    if expense.save
      redirect_to root_path, notice: "Created successfully"
    else
      redirect_to root_path, alert: "Error creating expense: " + expense.errors.full_messages.to_sentence
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

  def calculate_total
    @balance = - Expense.total
  end
end
