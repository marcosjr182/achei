# -*- encoding : utf-8 -*-
class Item < ActiveRecord::Base
  belongs_to :place
  belongs_to :category
  belongs_to :user
  acts_as_taggable 
end
