class AddCategoryRefToItems < ActiveRecord::Migration
  def change
    add_reference :items, :category_id, :string
  end
end
