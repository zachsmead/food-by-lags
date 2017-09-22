class TextsController < ApplicationController

	def add_text_to_comment
		name = params[:name]
		text = params[:text]
		commentId = params[:comment_id]

		@new_text = Text.create(name: name,
								text: text,
								comment_id: commentId,
								approved: false)
		if @new_text.save
			OrderMailer.text_approval(@new_text).deliver
			redirect_to "/contacts" 
			flash[:success] = "Your text has been successfully sent."

		else
			flash[:danger] = "Something went wrong with the mailing process."
			redirect_to "/contacts"

		end
	end
end
