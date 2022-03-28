def find_avg_of_day()


puts "enter year"
year=gets.to_i
puts "enter month"
month=gets.chomp.to_s



file = File.open("Dubai_weather/Dubai_weather_#{year}_#{month}.txt")



filedata = []

file.each_line do |line|
  data = line.split(",")
  next unless data[0].match(/#{year}/)

  linehash = { "date" => data[0], "maxtemp" => data[1].to_i, "mintemp" => data[3].to_i,
               "humidity" => data[7].to_i }
  filedata.push(linehash)
end

count=0
avgofmaxtemp = 0
avgofmintemp = 0
avgofhum = 0

filedata.each do |data|
    avgofmaxtemp+=data["maxtemp"]
    avgofmintemp+=data["mintemp"]
    avgofhum+=data["humidity"]
    count+=1
end

totalavgofmaxtemp=avgofmaxtemp/count
totalavgofmintemp=avgofmintemp/count
totalavgofhum=avgofhum/count

puts "Highest Average:#{totalavgofmaxtemp}C"
puts "lowest Average:#{totalavgofmintemp}C"
puts "Average Humidity:#{totalavgofhum}%"
 
end
