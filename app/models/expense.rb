class Expense < ActiveRecord::Base
  validates :price, presence: true
end
