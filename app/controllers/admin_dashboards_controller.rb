class AdminDashboardsController < ApplicationController

  def show
    @city = City.new
    @cohort = Cohort.new
  end

end
