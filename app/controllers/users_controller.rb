class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @status  = Status.new
  end

  def index
    @user = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  private

  def cohort_params
    params.require(:user).permit(:email, :city_id, :cohort_id)
  end

end  
