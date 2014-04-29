class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(cty_params)
    if @city.save
      redirect_to @department
    else
      render :new
    end
  end

  def show
    @city = find_city
    @users = @city.users
  end

  def update
    @city = find_city
    if @city.update(city_params)
      redirect_to @city
    else
      render :edit
    end
  end

  def destroy
    city = find_city
    city.destroy
    redirect_to cities_path
  end

  private

  def city_params
    params.require(:city).permit(:name, :state)
  end
  
  def find_city
    City.find(params[:id])
  end    

end
