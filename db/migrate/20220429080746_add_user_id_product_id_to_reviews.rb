class AddUserIdProductIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :content, :string
    add_column :reviews, :user_id, :integer, foreign_key: true
    add_column :reviews, :product_id, :integer, foreign_key: true
  end
end
