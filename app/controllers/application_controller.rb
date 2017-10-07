class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception




  def current_user
  	@current_user ||= User.find_by(id: session[:id]) if session[:id]
  end
  helper_method :current_user

  def about_me
  	about_me = "Hi, I am Juliana Lagattuta- soon to be Mrs. Sabraw! I am an avid macro counter, I love to cook, and I love to have an all-around balanced healthy lifestyle. I have tried many styles of lifting, crossfit, bodybuilding, powerlifting, and olympic lifting. I have even competed in some crossfit competitions. I have tried several diets: carb cycling, keto diet, set macros based on percentages, and paleo. Overall, my goal is to have a balanced lifestyle; being active whether it’s in a gym or outside; and eating to not only keep me healthy but to fuel my body properly so I am constantly feel well mentally and physically." 
  end
  helper_method :about_me

  def about_me_two
  	about_me_two = "When I met my fiancé (in a gym!!) he was also an avid macro counter and gym rat.  Over the past several years my cooking has not only improved, but I have started learning how to switch ingredients out for healthier options and calculate the macros (fat, carbs, and protein) for each item I cooked. I meal prep for my fiancé every week and also for myself. I find the majority of my recipes from cookbooks, online, and social media. I alter about 95% of the recipes I find to make them healthier: lowering the fat, sugar, and or carbs by switching the ingredients. I love making lower carb meals because then I can eat more. I love me some food. I’ve had several people ask about my recipes so I have created a cookbook of my top recipes. I hope you enjoy. "
  end
  helper_method :about_me_two

# to activate authenticate_admin: 	before_action :authenticate_admin!, except: [:index, :show]
	def authenticate_admin!
		if !(current_user && current_user.admin)
			flash[:danger] = "You Must Be an Admin"
			redirect_to "http://www.foodbylags.com"
		end 

	end



  def visit_count
  	if session[:count]
  		session[:count] += 1
		else
			session[:count] = 0
		end

		@visit_count = session[:count]
	end
	helper_method :visit_count

end
