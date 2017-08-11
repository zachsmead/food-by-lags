document.addEventListener("DOMContentLoaded", function(event) {
	var app = new Vue({
		el: '#app',
		data: {
			buttons: [
				{
					name: 'Checkout',
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
			}
		}

	});
});