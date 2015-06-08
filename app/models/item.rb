# -*- encoding : utf-8 -*-
class Item < ActiveRecord::Base
  belongs_to :place
  belongs_to :category
  belongs_to :user
  has_many :commentaries
  mount_uploader :avatar, AvatarUploader
  acts_as_taggable 

  def self.search(search)
    where("name LIKE ?", "%#{search}%") 
    where("description LIKE ?", "%#{search}%")
  end
  def tag
    ActiveSupport::Inflector.transliterate(self.tag_list.first)
  end

end
