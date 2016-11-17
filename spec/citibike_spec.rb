require "./app/citi_bike"
describe "Citbike slackbot" do
  def app
    CitiBike.new
  end

  it "Returns available docks at a station." do
    post "/citibike"
    expect(last_response.status).to be 200
    expect(last_response.body).to eq "There are no docks."
  end
end
