class CommentsController < ApplicationController
	
	def index
		@approved_comments = Comment.where(approved: true)
	end

	def approved
		@comment = Comment.find(params[:id])
		@comment.approved = true
		@comment.save
		flash[:success] = "You successfully approved the comment"
		redirect_to "/contacts"
	end

	def text_approved
		@text = Text.find(params[:id])
		@text.approved = true
		@text.save
		flash[:success] = "You successfully approved the comment"
		redirect_to "/contacts"
	end


	def comment_delete
		@comment = Comment.find(params[:id])
		@comment.delete
		@comment.save
		flash[:danger] = "You deleted the comment"
		redirect_to "/contacts"
	end

	def text__delete
		@text = Text.find(params[:id])
		@text.delete
		@text.save
		flash[:danger] = "You deleted the comment"
		redirect_to "/contacts"
	end


	def new
	end

	def create
		name = params[:name]
		text = params[:text]

		@comment = Comment.new(
			name: name,
			text: text,
			approved: false
		)
		@comment.save

		# OrderMailer
		if @comment.save
			OrderMailer.comment_approval(@comment).deliver
			redirect_to "/contacts"
			flash[:success] = "Your comment or question has been successfully sent."
		else
			flash[:danger] = "Something went wrong with the mailing process."
			redirect_to "/contacts"
		end
	end	


end
