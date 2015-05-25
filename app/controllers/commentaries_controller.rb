class CommentariesController < ApplicationController
  before_action :set_commentary, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @commentaries = Commentary.all
    respond_with(@commentaries)
  end

  def show
    respond_with(@commentary)
  end

  def new
    @commentary = Commentary.new
    respond_with(@commentary)
  end

  def edit
  end

  def create
    @commentary = Commentary.new(commentary_params)
    @commentary.save
    respond_with(@commentary)
  end

  def update
    @commentary.update(commentary_params)
    respond_with(@commentary)
  end

  def destroy
    @commentary.destroy
    respond_with(@commentary)
  end

  private
    def set_commentary
      @commentary = Commentary.find(params[:id])
    end

    def commentary_params
      params.require(:commentary).permit(:item_id, :user_id, :message)
    end
end
