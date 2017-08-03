class Order < ApplicationRecord
	belongs_to :user
	has_many :products, through: :carts
	has_many :carts
end
