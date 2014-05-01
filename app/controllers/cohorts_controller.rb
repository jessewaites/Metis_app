class CohortsController < ApplicationController

  def index
    @cohorts = Cohort.all
  end

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.save
      redirect_to @cohort
    else
      render :new
    end
  end

  def edit
    @cohort = find_cohort
  end  

  def show
    @cohort = find_cohort
    @users = @cohort.users
  end

  def update
    @cohort = find_cohort
    if @cohort.update(cohort_params)
      redirect_to @cohort
    else
      render :edit
    end
  end

  def destroy
    cohort = find_cohort
    cohort.destroy
    redirect_to cohorts_path
  end

  private

  def cohort_params
    params.require(:cohort).permit(:year, :quarter)
  end
  
  def find_cohort
    Cohort.find(params[:id])
  end  

end
