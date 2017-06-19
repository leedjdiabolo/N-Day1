class CommentsController < ApplicationController

	def new
		@comments = Comment.new
		@bb = params[:pid]
	end

	def create
		@comments = Comment.new(bb_params)
		@comments.save

		redirect_to post_path(bb_params[:post_id],:uid => params[:uid])
	end

	def edit
		@comments = Comment.find(params[:id])
	end

	def update
		@comments =Comment.find(params[:id])
		@comments.update(bb_params)

		redirect_to post_path(params[:pid],:uid => params[:uid])
	end

	def destroy
		@comments = Comment.find(params[:id])
		@comments.destroy

		redirect_to post_path(params[:pid],:uid => params[:uid])
	end

	def bb_params
		params.require(:comment).permit(:content,:post_id)
	end
end
