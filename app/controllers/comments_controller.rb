class CommentsController < ApplicationController

	def create
		name = params[:name]
		text = params[:text]

		@comment = Comment.new(
			name: name,
			text: text
		)
		@comment.save

	end


end
