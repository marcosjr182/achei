# -*- encoding : utf-8 -*-
class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
