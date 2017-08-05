class Product < ApplicationRecord
	has_many :orders, through: :carts
	has_many :carts

	validates :name, presence: true
  	validates :name, length: { minimum: 2 }
  	validates :name, length: { maximum: 20 }


	validates :product_type, presence: true
	validates :stock, presence: true
	validates :cost, presence: true
end
