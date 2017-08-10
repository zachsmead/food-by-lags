class Order < ApplicationRecord
	has_many :products, through: :carts
	has_many :carts

	validates :subtotal, presence: true
	validates :tax, presence: true
	validates :total, presence: true



end
