class RemovedateFromexpenses < ActiveRecord::Migration[6.1]
  def change
    remove_column :expenses, :date, :date
  end
end
