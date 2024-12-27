class User < ApplicationRecord
    has_many :post, dependent: :destroy
    has_many :comments, dependent: :destroy
    
    has_secure_password


    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    
    validates :name, presence: true, length: {maximum: 50}
    validates :password, length: {minimum: 6}
    validates :email, presence: true, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: true }

end
