json.set! :carts do
	json.array! @cart.each do |item| 
		json.id item.id
		json.product_id item.product_id
		json.quantity item.quantity
		json.name item.product.name
		json.cost item.product.cost
		json.status item.status
	end
end

