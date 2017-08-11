class Cart < ApplicationRecord
	belongs_to :order, optional: true
	belongs_to :product, optional: true

	validates :quantity, presence: true
	validates :status, presence: true


end
