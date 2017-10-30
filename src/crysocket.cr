require "./crysocket/*"

require "kemal"

class Timestamp
  JSON.mapping({
    time: {type: Time, converter: Time::Format::ISO_8601_DATE_TIME},
  })

  def initialize(@time : Time = Time.now.to_utc)
  end
end

sockets = [] of HTTP::WebSocket

get "/time" do |env|
  env.response.content_type = "application/json"
  Timestamp.new.to_json
end

ws "/socket" do |socket|
  sockets.push socket

  socket.on_close do
    sockets.delete(socket)
    puts "Closing socket #{socket}"
  end
end

spawn do
  while true
    sleep 1.seconds
    sockets.each do |socket|
      socket.send Timestamp.new.to_json
    end
  end
end

Kemal.run
