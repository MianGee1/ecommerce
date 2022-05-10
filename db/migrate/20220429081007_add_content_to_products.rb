class AddContentToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :content, :string
  end
end
