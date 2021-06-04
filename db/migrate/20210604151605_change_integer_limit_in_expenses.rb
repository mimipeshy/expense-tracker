class ChangeIntegerLimitInExpenses < ActiveRecord::Migration[6.1]
  def change
    change_column :expenses, :amount, :integer, limit: 8
  end
end
