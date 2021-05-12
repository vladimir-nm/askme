class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Object successfully created'
      redirect_to @user
    else
      flash[:error] = 'Something went wrong'
      render :new
    end
  end

  def edit
  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,:name, :username, :avatar_url)
  end

end
