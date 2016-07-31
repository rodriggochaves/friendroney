class Expense < ActiveRecord::Base
  before_save :description_empty_string_if_nil

  validates :value, presence: true, 
    :numericality => { :greater_than_or_equal_to => 0 }

  def self.imcompletes
    where(description: "")
      .sort_by{ |e| e.updated_at }.reverse
  end

  def self.total
    self.all.map{ |e| e.value }.inject(:+).to_i
  end

  def description_empty_string_if_nil
    "" if nil
  end
end
