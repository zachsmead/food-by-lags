class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= User.find_by(id: session[:id]) if session[:id]
  end
  helper_method :current_user


# to activate authenticate_admin: 	before_action :authenticate_admin!, except: [:index, :show]
	def authenticate_admin!
		if !(current_user && current_user.admin)
			flash[:danger] = "You Must Be an Admin"
			redirect_to "/"
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
