class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @followers = @user.followees(User)
    @posts = @user.posts.order("updated_at DESC")
    render 'show.html.erb'

  end

  def new_post
    @user = current_user
    @post = Post.new(:content => params[:post_content])
    @post.save
    @user.posts << @post
    @user.save
    @post = Post.where(:user_id => current_user.id)

    redirect_to action: :show
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

  def view_followers
    @user = User.find(params[:id])
  end

private
  def user_params
     params.require(:user).permit(:first_name, :last_name, :posts, posts_attributes: [:id, :content, :_destroy])
 end
end
