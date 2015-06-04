# -*- encoding : utf-8 -*-
class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.text :description
      t.string :reward
      t.boolean :flexible
      t.references :owner, index: true
      t.references :buyer, index: true
      t.references :item, index: true

      t.timestamps
    end
  end
end
