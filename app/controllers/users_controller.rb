class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_user_name(params[:user][:user_name])
    if @user.present?
      redirect_to user_topics_path(@user)
    else
      @user = User.new(user_params)
      if @user.save
        redirect_to user_topics_path(@user)
      else
        render :new
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:user_name)
    end

end
