# -*- encoding : utf-8 -*-
class AddPlaceRefToItems < ActiveRecord::Migration
  def change
    add_reference :items, :place, index: true
  end
end
