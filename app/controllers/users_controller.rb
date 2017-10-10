class UsersController < ApplicationController

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    if @user.save
      flash[:success] = "Welcome to ChatBauwkx"
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:email)
    end
  
end