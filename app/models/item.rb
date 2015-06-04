# -*- encoding : utf-8 -*-
class Item < ActiveRecord::Base
  belongs_to :place
  belongs_to :category
  belongs_to :user
  has_many :commentaries
  acts_as_taggable 

  def self.search(search)
    where("name LIKE ?", "%#{search}%") 
    where("description LIKE ?", "%#{search}%")
  end

end
