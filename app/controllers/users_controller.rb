class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    #@limit = Setting.first.entity_limit
    #offset = params[:offset].to_i || 0
    #@users = User.all.limit(@limit).offset(offset).order(email: :asc)
    #@total_records = User.all.count

    @users = User.all.order(email: :asc)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, success: 'User was created'
    else
      flash.now[:danger] = @user.errors.full_messages.first
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    session[:return_to] = request.referer
  end

  def update
    user_parameters = user_params
    user_parameters.delete(:password) if user_parameters[:password].blank?

    if @user.update(user_parameters)
      
      if current_user.id == @user.id
        bypass_sign_in(current_user)
      end
      
      redirect_to(session.delete(:return_to) || users_path, success: 'User was updated')
    else
      flash.now[:danger] = @user.errors.full_messages.first
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, success: 'User was deleted'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name) 
  end
end