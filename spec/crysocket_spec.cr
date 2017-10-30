require "./spec_helper"

describe Crysocket do
  # TODO: Write tests

  it "renders time" do
    get "/time"
    response.status_code.should eq 200
    remote = Timestamp.from_json response.body
    remote.time.utc?.should eq true
  end
end
