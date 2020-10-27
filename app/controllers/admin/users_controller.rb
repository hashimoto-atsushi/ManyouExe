class Admin::UsersController < ApplicationController
  before_action :set_users, only:[:edit, :show, :update, :destroy]
  before_action :require_admin, only:[:index, :edit, :update, :destroy]
  before_action :current_user_show, only:[:show]

  def index
    @users = User.select(:id, :name, :email)
  end

  def new
    if current_user&.admin? || logged_in? == false
      @user = User.new
    elsif logged_in?
      redirect_to tasks_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), notice: "ログインしました"
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def set_users
    @user = User.find(params[:id])
  end

  def require_admin
    if current_user&.admin == false
      redirect_to tasks_path, notice: "管理者以外はアクセスできません"
    elsif logged_in? == false
      redirect_to new_session_path, notice: "管理者以外はアクセスできません"
    end
    # redirect_to new_session_path unless current_user&.admin?
    # flash[:notice] = "管理者以外はアクセスできません"
  end

  def current_user_show
    if current_user.admin == false
    redirect_to tasks_path unless current_user.id == @user.id
    end
  end

end
