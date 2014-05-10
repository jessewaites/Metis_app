class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added Friend."
      redirect_to user_path(params[:friend_id])
    else
      flash[:notice] = "Unable to Add."
      redirect_to current_user
    end
  end

  def destroy 
    friendship = current_user.friendships.find(params[:id])
    friendship.destroy
    flash[:notice] = "Successfully removed friendship."
    redirect_to current_user
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end

end
