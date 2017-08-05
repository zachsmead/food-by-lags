class Order < ApplicationRecord
	belongs_to :user
	has_many :products, through: :carts
	has_many :carts

	validates :user_id, presence: true
	validates :subtotal, presence: true
	validates :tax, presence: true
	validates :total, presence: true



end
