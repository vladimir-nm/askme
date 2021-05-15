class UsersController < ApplicationController
  before_action :load_user, except: %i[index create new]
  before_action :authorize_user, except: %i[:index :new :create :show]

  def index
    @users = User.all
  end

  def new
    redirect_to root_url, alert: 'Вы уже залогинены' if current_user.present?
    @user = User.new
  end

  def create
    redirect_to root_url, alert: 'Вы уже залогинены' if current_user.present?

    @user = User.new(user_params)

    if @user.save
      # redirect_to root_url, notice: 'Пользователь успешно зарегистрирован!'
      flash[:success] = 'Пользователь успешно зарегистрирован!'
      redirect_to root_url
    else
      flash[:error] = 'Something went wrong'
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      # redirect_to user_path(@user), notice: 'Данные обновлены!'
      flash[:success] = 'Данные обновлены!'
      redirect_to user_path(@user)
    else
      flash[:error] = 'Something went wrong'
      render :edit
    end
  end

  def show
    @questions = @user.questions.order(create_at: :desc)

    @new_question = @questions.build
  end

  private

  def authorize_user
    reject_user unless @user == current_user
  end

  def load_user
    @user ||= User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :username, :avatar_url)
  end
end
