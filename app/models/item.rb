class Item < ActiveRecord::Base
  belongs_to :place
  belongs_to :category
end
