class CarsController < ApplicationController
  def index
    @cars = Car.all
    # @cars = Unirest.get("http://localhost:3000/cars.json").body    
  end
  
  def show
    @car = Car.find(params[:id])
  end

  def create

    @car = Car.create({car_maker: params[:car_maker], car_model: params[:car_model], year: params[:year], color: params[:color]})

    redirect_to "/cars/#{@car.id}"

  end

  def edit
    @car = Car.find(params[:id])


  end

  def update
    @car = Car.update({car_maker: params[:car_maker], car_model: params[:car_model], year: params[:year], color: params[:color]})

    redirect_to "/cars/#{@car.id}"
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to "/cars"
  end

end
