require 'ostruct'

class UsersController < ApplicationController
  before_filter :authenticate_user! 

  def show
    @user = User.find(params[:id])
    @status  = Status.new
    github = Github.new client_id: '17a5794a8a7e2916f0fb', client_secret: '91aeef83e0b9e98f80a63fd4fe69662b7e939893'
    @repos = begin
      github.repos.list(user: @user.github_username)
    rescue Github::Error::Forbidden
      []
    end
    @statuses = @user.statuses.order('created_at DESC')
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
