# -*- encoding : utf-8 -*-
class Proposal < ActiveRecord::Base
  has_one :owner, class_name: "User"
  has_one :buyer, class_name: "User"
  has_one :item
end
