# -*- encoding : utf-8 -*-
class Item < ActiveRecord::Base
  belongs_to :place
  belongs_to :category
  belongs_to :user
  has_many :commentaries
  acts_as_taggable 
end
