require 'colorize'

puts 'enter year'
year = gets.chomp.to_i
puts 'enter month'
month = gets.chomp.to_s

file = File.open("Dubai_weather/Dubai_weather_#{year}_#{month}.txt")

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

  data["maxtemp"].times do
    print "+".red
  end
  puts data["maxtemp"]

  print data["date"]
  data["mintemp"].times do
    print "+".blue
  end
  puts data["mintemp"]
end
