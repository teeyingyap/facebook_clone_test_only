class User < ActiveRecord::Base
	has_many :statuses, foreign_key: :user_id, dependent: :destroy
	has_many :likes, foreign_key: :user_id, dependent: :destroy
    validates :email, presence: true
    validates :name, presence: true
    validates :email, uniqueness: true
    validates :password, presence: true
    validates_confirmation_of :password
    validates :password_confirmation, presence: true
    validates :password, length: 6..20
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "Only valid email allowed."}
    has_secure_password
    
end
