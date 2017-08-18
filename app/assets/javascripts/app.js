document.addEventListener("DOMContentLoaded", function(event) {
	var app = new Vue({
		el: '#app',
		data: {
			bag: [],
			add_to_bag: [],
			products: [],
			finalBag: [],
			brand_new_bag: [],


			total: 0,
			firstNameBox: "",
			lastNameBox: "",
			emailBox: "",
			addressOneBox: "",
			addressTwoBox: "",


			buttons: [
				{
					name: 'Checkout',
					visible: false
				},
				{
					name: 'Floating Menu',
					visible: false
				},
				{
					name: 'showOrder',
					visible: false
				}

			]
		},
		mounted: function() {
			console.log('Vue.js!');
			$.get('http://localhost:3000/api_for_lags/products_index.json', function(result) {
				console.log(result);
				this.products = result;
				console.log('products below');
				console.log(this.products);
			}.bind(this));
		},
		methods: {
			removeFromCart: function(cart_item) {
				console.log('removeFromCart is Functioning');
				console.log('cart_item below');
				console.log(cart_item);
				var jsonCartItem = JSON.stringify(cart_item);
				json_to_send = {
					newCart: jsonCartItem
				}

				$.post('http://localhost:3000/api_for_lags/delete_cart_item.json', json_to_send, function(result) {
					console.log(result);
				})
				window.location = "http://localhost:3000/products";

			},
			showButton: function() {
				console.log('showButton Running');
				variable = document.querySelector('buttons');
				this.buttons[0].visible = !this.buttons[0].visible;
			},
			addToBag: function(cart_item) {
				console.log("addToBag Functioning");
				this.add_to_bag.push(cart_item);
				console.log('this.add_to_bag below');
				console.log(this.add_to_bag);


				var jsonBag = JSON.stringify(cart_item);

				json_to_send = {
					newCart: jsonBag
				}

				this.bag.push(cart_item);

				console.log('jsonBag below')
				$.post('http://localhost:3000/api_for_lags/create.json', json_to_send, function(result) {
					console.log('result below');
					console.log(result);
				}.bind(this));


			},
			checkoutOrder: function() {
				this.buttons[2].visible = !this.buttons[2].visible;
				// $.get('http://localhost:3000/api_for_lags/index.json', function(result) {
				// 	console.log('checkoutOrder results below');
				// 	this.brand_new_bag.push(result['carts']);
				// 	console.log(result);
				// }.bind(this))
				// console.log('checkoutOrder working');
				// console.log('this.add_to_bag below');
				// var bagjson = JSON.stringify(this.bag);

				// var order_in_json = {
				// 	newOrder: bagjson
				// }
				// console.log('order_in_json below');
				// console.log(order_in_json);


				// $.post('http://localhost:3000/api_for_lags/checkout.json', order_in_json, function(result) {
				// 	console.log(result);
				// });
			},
			createOrder: function() {
				console.log('createOrder Functioning');
				console.log('Order form texts below');
				console.log(this.firstNameBox);
				console.log(this.lastNameBox);
				console.log(this.emailBox);
				console.log(this.addressOneBox);
				console.log(this.addressTwoBox);


				var firstName = JSON.stringify(this.firstNameBox);
				var lastName = JSON.stringify(this.lastNameBox);
				var email = JSON.stringify(this.emailBox);
				var address = JSON.stringify(this.addressOneBox) + JSON.stringify(this.addressTwoBox);

				var form = {
					first_name: firstName,
					last_name: lastName,
					email: email,
					address: address
				}




				$.post('http://localhost:3000/api_for_lags/create_order.json', form, function(result) {
					console.log('result below of create_order.json');
					console.log(result);
				})
				window.location = "http://localhost:3000/charges/new";
			}
		}

	});
});