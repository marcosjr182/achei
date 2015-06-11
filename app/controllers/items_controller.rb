# -*- encoding : utf-8 -*-
class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:category, :index]
  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    unless params[:search].nil?
      @items = Item.search(params[:search]).order("created_at DESC")
    else
      @items = Item.all.order('created_at DESC')
    end
  end

  def admin
    @items = Item.where(user_id: current_user.id)
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @proposal = Proposal.new
  end

  # GET /items/new
  def new
    @item = Item.new
    @places = Place.all
  end

  def category
    @items = Item.tagged_with(params[:tag_list])
    
    if params[:tag_list].include? "Achados&Perdidos"
      @items = Item.tagged_with(["achados","perdidos"], any: true)
    end

    if params[:tag_list].include? "Classificados"
      @items = Item.tagged_with(["aluguel","venda","doação"], any: true)
    end
  end

  # GET /items/1/edit
  def edit
    @places = Place.all
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.user = current_user
    
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :place_id, :user_id, :tag_list, :avatar,:reward, :flexible, :description, :value)
    end
end
