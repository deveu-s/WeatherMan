require 'colorize'
file = File.open("Dubai_weather/Dubai_weather_2004_Aug.txt")
year = 2004
filedata = []

file.each_line do |line|
  data = line.split(",")
  next unless data[0].match(/#{year}/)

  linehash = { "date" => data[0], "maxtemp" => data[1].to_i, "mintemp" => data[3].to_i,
               "humidity" => data[7].to_i }
  filedata.push(linehash)
end

filedata.each do |data|
  print data["date"]

  data["mintemp"].times do
    print "+".blue
  end

  data["maxtemp"].times do
    print "+".red
  end
  puts "#{data["mintemp"]}C - #{data["maxtemp"]}C"
end
