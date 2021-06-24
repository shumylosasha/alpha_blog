class UsersController < ApplicationController

  before_action :get_user, only:[:edit, :update, :show]

  def index
    @users = User.all
  end

  def show
    @articles = @user.articles
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update(form_params)
			flash[:notice] = "User successfuly updated"
			redirect_to articles_path
		else
			render "edit"
		end
  end


  def create
    @user = User.new(form_params)
    if @user.save
      flash[:notice] = "Welcome! #{@user.username} successcully saved"
      redirect_to articles_path
    else
      render "new"
    end

  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def form_params
    params.require(:user).permit(:username, :email, :password)
  end

end
