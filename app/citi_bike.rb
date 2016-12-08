require 'json'


class CitiBike
  def call(env)
    request = Rack::Request.new(env)
    text = request.params["text"]
    station = bike_station_status(text)
    [200,{},["#{station["num_bikes_available"]} bikes available"]]
  end

  def bike_station_status(text)
    response = Net::HTTP.get(URI("https://gbfs.citibikenyc.com/gbfs/en/station_status.json"))
    stations = JSON.parse(response)
    stations["data"]["stations"].find { |station| station["station_id"] == text }
  end
end
