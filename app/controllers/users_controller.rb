class UsersController < ApplicationController
	before_action :authenticate_user!, only:[:show, :edit, :update]
	before_action :ensure_correct_user, only:[:edit, :update]
	def ensure_correct_user
		@user = User.find(params[:id])
		if current_user != @user
			redirect_to posts_path
		end
	end


	def top
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts.order(id:"DESC")
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "UPDATE YOUR PROFILE !"
			redirect_to user_path(@user)
		else
			render("users/edit")
		end
	end

	protected
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

end
