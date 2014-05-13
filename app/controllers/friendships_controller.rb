class FriendshipsController < ApplicationController

  def create
    followed_user = User.find(params[:id])
    @friendship = current_user.follow(followed_user)
    if @friendship.save
      flash[:notice] = "Added Friend."
      redirect_to user_path(params[:id])
    else
      flash[:notice] = "Unable to Add."
      redirect_to current_user
    end
  end

  def destroy
    followed_user = User.find(params[:id])
    current_user.unfollow(followed_user)
    flash[:notice] = "Successfully removed friendship."
    redirect_to user_path(params[:id])
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end

end
