require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  describe "GET #new" do
    it "responds successfully with HTTP code 200" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "loads all imcompletes expenses" do
      expense1, expense2 = Expense.create!(value: 2), Expense.create!(value: 3)
      get :new
      expect(assigns(:expenses)).to match_array([expense1, expense2])
    end
  end

  describe "POST #create" do
    it "with only a positive value" do
      post :create, expense: { value: 2 }
      expect(Expense.last.value).to eq(2)
    end
  end
end
