class PostCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :post_categories do |t|
      t.integer :category_id, :post_id
      t.timestamps
    end
  end
end
