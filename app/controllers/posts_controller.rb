class PostsController < ApplicationController

	def new
		@posts = Post.new
		@bb = params[:uid]
	end

	def create
		@posts = Post.new(user_params)
		@posts.save

		redirect_to user_path(user_params[:user_id])
	end

	def show
		@posts = Post.find(params[:id])
		@comments = Comment.where(:post_id => params[:id])
	end

	def edit
		@posts = Post.find(params[:id])
		@bb = params[:uid]
	end

	def update
		@posts = Post.find(params[:id])
		@posts.update(user_params)

		redirect_to user_path(user_params[:user_id])
	end

	def destroy
		@posts = Post.find(params[:id])
		@posts.destroy

		redirect_to user_path(params[:uid])
	end

    def user_params
      params.require(:post).permit(:title, :content, :user_id)
    end
end
