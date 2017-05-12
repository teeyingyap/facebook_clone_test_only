class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :status 
  validates :user_id, presence: true
  validates :status_id, presence: true
  validates :user_id, uniqueness: {scope: :status_id}
end

