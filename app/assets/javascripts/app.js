document.addEventListener("DOMContentLoaded", function(event) {
	var app = new Vue({
		el: '#app',
		data: {
			bag: [],
			buttons: [
				{
					name: 'Checkout',
					visible: false
				},
				{
					name: 'Floating Menu',
					visible: false
				}

			]
		},
		mounted: function() {
			console.log('Vue.js!');
		},
		methods: {
			showButton: function() {
				console.log('showButton Running');
				variable = document.querySelector('buttons');
				this.buttons[0].visible = !this.buttons[0].visible;
			},
			addToBag: function() {
				this.buttons[1].visible = true;
				console.log("addToBag Functioning");
				this.bag.push("cookbook");
				console.log(this.bag);

			},
			checkOut: function() {

				this.buttons[1].visible = false;
			}
		}

	});
});