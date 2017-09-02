json.set! :products do
	json.array! @products.each do |item|
		json.id item.id
		json.name item.name
		json.image item.image
		json.product_type item.product_type
		json.stock item.stock
		json.cost item.cost
	end
end