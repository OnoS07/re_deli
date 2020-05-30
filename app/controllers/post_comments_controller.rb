class PostCommentsController < ApplicationController
	def create
		post_comment = PostComment.new(post_comment_params)
		post_comment.user_id = current_user.id
		post = Post.find(params[:post_id])
		post_comment.post_id = post.id
		if post_comment.save
			flash[:notice] = "NEW COMMENT CREATE"
			redirect_to post_path(post)
		elsif post_comment.comment.empty?
			flash[:comment] = "コメントを入力してください"
			redirect_to post_path(post)
		else
			flash[:comment] = "コメントは100文字以下までです"
			redirect_to post_path(post)
		end
	end

	def destroy
		post = Post.find(params[:id])
		post_comment = current_user.post_comments.find_by(post_id: post.id)
		post_comment.destroy
		flash[:notice] = "DELETE YOUR COMMENT"
		redirect_to post_path(post)
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end

end
