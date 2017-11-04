document.addEventListener("DOMContentLoaded", function(event) {
	var app = new Vue({
		el: '#app',
		data: {
			bag: [],
			add_to_bag: [],
			products: [],
			finalBag: [],
			brand_new_bag: [],
			commentAdd: "",
			name: "",
			text: "",
			nameText: "",
			textText: "",
			nameAdd: "",
			commentId: 0,

			addToBagID: "",


			total: 0,
			cost: 0,
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
			$.get('http://www.foodbylags.com/api_for_lags/products_index.json', function(result) {
				console.log(result.products);
				this.products = result.products;
				console.log('bag below');
				console.log(this.bag);
				}.bind(this));
			$.get('http://www.foodbylags.com/api_for_lags/carted_items.json', function(result) {
				if(this.bag.length === 0) {
					this.buttons[1].visible = false;
				} else if(this.bag.length >= 1) {
					this.buttons[1].visible = true;
				}
				console.log('carts below yo');
				console.log(result.carts);
				result.carts.forEach(function(carted_product) {
					this.loadBag(carted_product);
				}.bind(this));
				console.log('this.add_to_bag');
				console.log(this.add_to_bag);
				console.log('this.bag');
				console.log(this.bag);
				this.bag.forEach(item => {
					this.cost = item['newCart'].cost;
					this.total += parseInt(this.cost);
				});
				console.log('this.total below');
				console.log(this.total);
			}.bind(this));
		},
		methods: {
			removeFromCart: function(cart_item) {
				console.log('removeFromCart is Functioning');
				console.log('cart_item below @__@');
				console.log(cart_item);
				var jsonCartItem = JSON.stringify(cart_item);
				json_to_send = {
					newCart: jsonCartItem
				}

				$.post('http://www.foodbylags.com/api_for_lags/delete_cart_item.json', json_to_send, function(result) {
					console.log(result);
				})

				window.location = "http://www.foodbylags.com/products";

			},
			showButton: function() {
				console.log('showButton Running');
				// variable = document.querySelector('buttons');
				// this.buttons[0].visible = !this.buttons[0].visible;
			},
			loadBag: function(cart_item) {
				console.log("loadBag Functioning");
				this.add_to_bag.push(cart_item);
				console.log('this.add_to_bag below');
				console.log(this.add_to_bag);


				var jsonBag = JSON.stringify(cart_item);

				var json_to_send = {
					newCart: cart_item
				};
				this.bag.push(json_to_send);
				console.log('LOADED BAG BELOW');
				console.log(this.bag);
				console.log('jsonBag below');
			},
			addToBag: function(cart_item) {
				console.log("addToBag Functioning");
				this.add_to_bag.push(cart_item);
				console.log('this.add_to_bag below');
				console.log(this.add_to_bag);


				var jsonBag = JSON.stringify(cart_item);

				var json_to_send = {
					newCart: cart_item
				};
				console.log(this.bag.inspect);
				this.bag.push(json_to_send);
				console.log('jsonBag below');
				const to_be_cost = json_to_send['newCart'];
				console.log('to_b_cost below');
				console.log(to_be_cost);
				const costly = to_be_cost.cost;
				console.log('costly below');
				console.log(costly);
				console.log('this.total below');
				console.log(this.total);
				this.total = this.total + parseInt(costly);
				console.log('this.total below');
				console.log(this.total);
				console.log('json_to_send below');
				console.log(json_to_send);
				$.post('http://www.foodbylags.com/api_for_lags/create.json', json_to_send, function(result) {
					console.log('this.addToBagID below');
					console.log(this.addToBagID);
					console.log('result[id] below');
					console.log(result['id']);
					console.log('result below');
					console.log(result);

					this.addToBagID = result['id'];
					console.log('result id below');
					console.log(result['id']);

					json_to_send.id = this.addToBagID;
					console.log('updated json_to_send below');
					console.log(json_to_send);
					setTimeout(function(){}, 2000);
					console.log('bag below here yo');
					console.log(this.bag.inspect);			


				}.bind(this));
			},
			checkoutOrder: function(item) {
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
				//


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
				const orderId = 0;



				var email = JSON.stringify(this.emailBox);
				var address = this.addressOneBox + " " + this.addressTwoBox;

				var form = {
					firstName: this.firstNameBox,
					lastName: this.lastNameBox,
					email: this.emailBox,
					address: address
				}
				console.log('form below @__@ @__@ @__@ @__@ @__@ @__@ @__@ @__@ @__@ @__@ @__@');



				$.post('http://www.foodbylags.com/api_for_lags/create_order.json', form, function(result) {
					console.log('result below of create_order.json');
					console.log(result);
					this.orderId = result['id'];
					window.location = "http://www.foodbylags.com/charges/new_with_id/" + this.orderId;

				})
			},
			commentSend: function() {
				console.log('Send Comment Functioning');
				console.log('this.name below');
				console.log(this.name);
				console.log('this.text below');
				console.log(this.text);

				var comment_to_send = {
					newComment: this.text,
					name: this.name
				}
				$.post('http://www.foodbylags.com/api_for_lags/create_comment.json', comment_to_send, function(result) {
					console.log('commentSend api call running');
					console.log(result);
				}.bind(this))
				window.location = "http://www.foodbylags.com/contacts";
			},
			textSend: function(id) {
				console.log('send text running');
				console.log('this.textText below');
				console.log(this.textText);
				console.log('this.nameText');
				console.log(this.nameText);
				console.log('id below');
				console.log(id);
				
				var text_to_send = {
					newText: this.textText,
					name: this.nameText,
					commentId: id
				}
				$.post('http://www.foodbylags.com/texts/add_text_to_comment.json', text_to_send, function(result) {
					console.log('text send api running');
					console.log(result);
				})
				window.location = "http://www.foodbylags.com/contacts";
			},
			seeCart: function() {
				console.log('seeCart function activated');
				if(this.bag.length === 0) {
					alert('Your Cart Is Empty');
				} else {
					this.buttons[1].visible = true;
					console.log('cart shown');
				}
				$.get('http://www.foodbylags.com/api_for_lags/carted_items.json', function(result) {
					console.log('carts below yo');
					console.log(result.carts);
				})
			}
		}

	});
});
