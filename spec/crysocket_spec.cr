require "./spec_helper"

describe Crysocket do
  it "redirects root to time" do
    get "/"
    response.status_code.should eq 302
    puts response.headers["Location"].should eq "/time"
  end

  it "renders time" do
    get "/time"
    response.status_code.should eq 200
    remote = Timestamp.from_json response.body
    remote.time.utc?.should eq true
  end

  # TODO - testing websocket endpoint
end
