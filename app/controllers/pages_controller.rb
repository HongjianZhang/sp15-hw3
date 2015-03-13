class PagesController < ApplicationController

	def index
    	@user = User.all
    	@cat = Cat.all
    	@todo = Todos.all

	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user =User.create(user_params)
		if @user.save
			redirect_to @user
		else
			render "new"
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email)
	end
end