class StatusesController < ApplicationController

  def index
    @status = Status.all
  end

  def new
    @status = Status.new
    @user = current_user
  end

  def create
    user = User.find(params[:user_id])
    @status = user.statuses.new(status_params)
    if @status.save
      redirect_to user
    else
      render :new
    end
  end

  def edit
    @status = find_status
  end  

  def show
    @status = find_status
    @users = @cohort.users
  end

  def update
    @status = find_status
    if @status.update(status_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    status = find_status
    status.destroy
    redirect_to root_path
  end

  private

  def status_params
    params.require(:status).permit(:status)
  end
  
  def find_status
    Status.find(params[:id])
  end  

end
