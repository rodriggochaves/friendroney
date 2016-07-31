class Expense < ActiveRecord::Base
  validates :value, presence: { message: "can't be blank" }
  validates :value, numericality: { :greater_than_or_equal_to => 0, 
    message: "must be greater than 0" }

  def self.imcompletes
    where(description: "")
      .sort_by{ |e| e.updated_at }.reverse
  end

  def self.total
    self.all.map{ |e| e.value }.inject(:+).to_i
  end
end
