class Expense < ActiveRecord::Base
  validates :value, presence: true, 
    :numericality => { :greater_than_or_equal_to => 0 }

  def self.imcompletes
    where(description: "")
      .sort_by{ |e| e.updated_at }.reverse
  end

  def self.total
    self.all.map{ |e| e.value }.inject(:+).to_i
  end
end
