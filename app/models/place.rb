# -*- encoding : utf-8 -*-
class Place < ActiveRecord::Base
  has_many :items
end
