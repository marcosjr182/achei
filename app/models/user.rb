# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :items
  has_many :commentaries
  has_many :proposals
  mount_uploader :avatar, AvatarUploader
  before_save :default

  def default
    self.avatar ||= "sem_imagem.png"
  end

  def inbox
    Proposal.where(owner_id: self.id)
    Proposal.where(buyer_id: self.id)
  end
  def sent_proposals
    Proposal.where(buyer_id: self.id)
  end

end
