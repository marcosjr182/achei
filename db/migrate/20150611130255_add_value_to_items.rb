class AddValueToItems < ActiveRecord::Migration
  def change
    add_column :items, :value, :float
  end
end
