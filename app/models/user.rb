class User < ApplicationRecord
	has_secure_password
	has_many :products
	has_many :orders
	has_many :carts

	validates :email, presence: true
	validates :email, uniqueness: true
	validates :password_digest, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true
  	validates :first_name, length: { minimum: 2 }
  	validates :first_name, length: { maximum: 20 }
  	validates :last_name, length: { minimum: 2 }
  	validates :last_name, length: { maximum: 20 }

  	validates :email, length: { minimum: 2 }
  	validates :email, length: { maximum: 40 }



end
