class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.decimal :price
      t.text :description

      t.timestamps null: false
    end
  end
end
