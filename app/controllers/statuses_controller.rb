class StatusesController < ApplicationController
  before_action :find_status, only: [:edit, :show, :update, :destroy]

  def index
    @status = Status.all
  end

  def new
    @status = Status.new
    @user = current_user
  end

  def create
    user = current_user
    @status = user.statuses.new(status_params)
    if @status.save
      redirect_to user
    else
      render :new
    end
  end

  def edit
  end  

  def show
  end

  def update
    if @status.update(status_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @status.destroy
    redirect_to root_path
  end

  private

  def status_params
    params.require(:status).permit(:text)
  end
  
  def find_status
    @status = Status.find(params[:id])
  end  

end
