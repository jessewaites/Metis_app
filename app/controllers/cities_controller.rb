class CitiesController < ApplicationController
  before_action :find_city, only: [:edit, :show, :update, :destroy]

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to @city
    else
      render :new
    end
  end

  def edit
  end  

  def show
    @users = @city.users
  end

  def update
    if @city.update(city_params)
      redirect_to @city
    else
      render :edit
    end
  end

  def destroy
    city.destroy
    redirect_to cities_path
  end

  private

  def city_params
    params.require(:city).permit(:name, :state, :address, :latitude, :longitude)
  end
  
  def find_city
    City.find(params[:id])
  end    

end
