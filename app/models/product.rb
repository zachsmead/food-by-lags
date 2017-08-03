class Product < ApplicationRecord
	has_many :orders, through: :carts
	has_many :carts
end
