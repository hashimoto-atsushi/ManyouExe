class Admin::UsersController < ApplicationController
  before_action :set_users, only:[:edit, :show, :update, :destroy]
  before_action :require_admin, only:[:edit, :update, :destroy, :index]
  skip_before_action :login_required, only:[:new]
  before_action :current_user_show, only:[:show]

  def index
    @users = User.all
  end

  def new
    if logged_in?
      redirect_to tasks_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to tasks_path, notice: "新規ユーザー#@user.name}が登録されました"
    else
      redner :new
    end
  end

  def edit
    @user
  end

  def update
    @user
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id), notice: "ユーザー#{@user.name}情報が編集されました"
    else
      redner :new
    end
  end

  def show
    @user
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_users
    @user = User.find(params[:id])
  end

  def require_admin
    redirect_to new_session_path unless current_user&.admin?
  end

  def current_user_show
    redirect_to tasks_path unless current_user.id == @user.id
  end
end
