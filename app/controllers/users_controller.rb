class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @followers = @user.followees(User)
    render 'show.html.erb'
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow!(@user)
    redirect_to action: :show
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow!(@user)
    redirect_to action: :show
  end
end
