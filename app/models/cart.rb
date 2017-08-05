class Cart < ApplicationRecord
	belongs_to :order, optional: true
	belongs_to :product, optional: true
	belongs_to :user

	validates :user_id, presence: true
	validates :product_id, presence: true
	validates :quantity, presence: true
	validates :status, presence: true


end
