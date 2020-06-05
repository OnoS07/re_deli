class PostCommentsController < ApplicationController
	def create
		@post_comment = PostComment.new(post_comment_params)
		@post_comment.user_id = current_user.id
		@post = Post.find(params[:post_id])
		@post_comment.post_id = @post.id
		if @post_comment.save
			flash.now[:notice] = "NEW COMMENT CREATE"
		end
	end

	def destroy
		@post_comment = PostComment.find(params[:post_id])
		@post = @post_comment.post
		@post_comment.destroy
		flash.now[:notice] = "DELETE YOUR COMMENT"
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end

end
