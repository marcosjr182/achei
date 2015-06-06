# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  #before_action :authenticate_user!, only: [:messages]
  def index
    @items = Item.new
  end

end
