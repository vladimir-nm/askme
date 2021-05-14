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
      #redirect_to root_url, notice: 'Пользователь успешно зарегистрирован!'
      flash[:success] = 'Пользователь успешно зарегистрирован!'
      redirect_to root_url
    else
      flash[:error] = 'Something went wrong'
      render :new
    end
  end

  def edit
    
  end
  
  def show
    @user = User.find params[:id]
    @questions = @user.questions.order(create_at: :desc)

    @new_question = @questions.build
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,:name, :username, :avatar_url)
  end

end
