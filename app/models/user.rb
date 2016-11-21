class User < ApplicationRecord
  #Allows users to login and own tales
  has_many :tale, dependent: :destroy #sets relationship with tale, and makes tale reliant on user
  has_many :comments, dependent: :destroy #sets relationship with comments, and makes comments reliant on user
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png" #Paperclip Avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/ #Validates image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #Devise values
  def to_param
  	username #sets /u/:id to /u/username
  end
end
