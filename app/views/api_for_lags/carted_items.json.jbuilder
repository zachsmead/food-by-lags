json.set! :carts do
	json.array! @carts.each do |item| 
		json.id item.id
		json.product_id item.product_id
		json.quantity item.quantity
		json.status item.status
	end
end

