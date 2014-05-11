class UsersController < ApplicationController
  before_filter :authenticate_user! 

  def show
    @user = User.find(params[:id])
    @status  = Status.new
    @repos = Github.repos.list user: 'jsteiner'
    #@repos = repos.select { |r| r.fork == true }
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
