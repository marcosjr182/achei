# -*- encoding : utf-8 -*-
class AddUserRefToItems < ActiveRecord::Migration
  def change
    add_reference :items, :user, index: true
  end
end
