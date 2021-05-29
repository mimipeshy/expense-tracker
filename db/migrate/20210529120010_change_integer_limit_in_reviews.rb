class ChangeIntegerLimitInReviews < ActiveRecord::Migration[6.1]
  def change
    change_column :reviews, :score, :integer, limit: 8
  end
end
