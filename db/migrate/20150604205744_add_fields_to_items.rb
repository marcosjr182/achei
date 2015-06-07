class AddFieldsToItems < ActiveRecord::Migration
  def change
    add_column :items, :description, :text
    add_column :items, :payment, :string
    add_column :items, :reward, :string
    add_column :items, :flexible, :boolean
  end
end
