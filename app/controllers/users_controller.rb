class UsersController < ApplicationController

  def new
    @user = User.new
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

  def form_params
    params.require(:user).permit(:username, :email, :password)
  end

end
