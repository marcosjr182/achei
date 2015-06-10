# -*- encoding : utf-8 -*-
class ProposalsController < ApplicationController
  before_action :set_proposal, only: [ :edit, :update, :destroy]

  respond_to :html

  def index
    @proposals = current_user.sent_proposals
  end

  def show
    @item = Item.find(params[:id])
    @proposals = Proposal.where(item_id: @item.id)
  end

  def new
    @proposal = Proposal.new
    @item = Item.find(params[:item_id])
    respond_to { |format| format.js } 
  end

  def edit
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.status = "pendente"
    @proposal.save
    redirect_to item_path(@proposal.item)
  end

  def update
    @proposal.update(proposal_params)
    respond_with(@proposal)
  end

  def destroy
    @proposal.destroy
    respond_with(@proposal)
  end

  private
    def set_proposal
      @proposal = Proposal.find(params[:id])
    end

    def proposal_params
      params.require(:proposal).permit(:description, :owner_id, :buyer_id, :item_id)
    end
end
