# -*- encoding : utf-8 -*-
class Proposal < ActiveRecord::Base
  has_one :owner, class_name: "User"
  has_one :buyer, class_name: "User"
  has_one :item

  def owner
    User.find(self.owner_id)
  end
  def buyer
    User.find(self.buyer_id)
  end
  def item
    Item.find(self.item_id)
  end

  def approve
    self.status = "aprovado"
    Proposal.where.not(id: self.id).each do |p|
      p.status = "recusado"
    end
  end
  
end
