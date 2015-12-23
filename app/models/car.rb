class Car

attr_accessor :car_maker, :car_model, :car_year, :car_color, :id

  def initialize(hash)
    @id = hash["id"]
    @car_maker = hash["car_maker"]
    @car_model = hash["car_model"]
    @car_year = hash["car_year"]
    @car_color = hash["car_color"]

  end

  def self.find(id)
    car_hash = Unirest.get("http://localhost:3000/api/v1/cars/#{id}.json").body
    Car.new(car_hash)
  end

  def self.all
    cars = []
    car_hashes = Unirest.get("http://localhost:3000/api/v1/cars.json").body 
    car_hashes.each do | hash |
      cars << Car.new(hash)
    end 
    return cars
  end

  def self.create(attributes)

  car_hash = Unirest.post("http://localhost:3000/api/v1/cars.json", headers:{ "Accept" => "application/json" }, parameters: attributes).body
  car = Car.new(car_hash)

  end

  def update(attributes)
    car_hash = Unirest.patch("http://localhost:3000/api/v1/cars.json", headers:{ "Accept" => "application/json" }, parameters: attributes).body
    Car.new(car_hash)
  end

  def destroy
    Unirest.delete("http://localhost:3000/api/v1/cars/#{id}.json").body
  end

end