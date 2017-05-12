class Status < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
  validates :title, length: { minimum: 8, message: "title is too short" }
  validates :content, length: { minimum: 10, message: "content is too short" }

  def self.first
  	self.order("created_at DESC").first
  end 


end



