# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  #before_action :authenticate_user!, only: [:messages]
  def index
    @items = Item.new
  end

  def search
    unless params[:search].nil?
      @items = Item.search(params[:search])
    else
      @items = Item.all.order('created_at DESC')
    end
  end
end
