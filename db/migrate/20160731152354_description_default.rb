class DescriptionDefault < ActiveRecord::Migration
  def change
    change_column :expenses, :description, :text, default: ""
  end
end
