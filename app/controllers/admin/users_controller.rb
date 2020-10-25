class Admin::UsersController < ApplicationController
  before_action :set_users, only:[:edit, :show, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user =  User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: '新規ユーザーが登録されました'
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
      redirect_to admin_user_path(@user.id), notice: 'ユーザー情報が登録されました'
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
end
