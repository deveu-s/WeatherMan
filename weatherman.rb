require_relative "maxtemp"
require_relative "avgtemp"

def highest_temp()
puts 'Enter year'

year = gets.to_i

files = Dir.glob("*Dubai_weather/Dubai_weather_#{year}_*")

anualmaxdata = []
anualmindata = []
anualhumidday = []

files.each do |file|
  monthlyymax, monthlymin, monthlyhumidity = find_max_min_of_day(file, year)
  anualmaxdata.push monthlyymax
  anualmindata.push monthlymin
  anualhumidday.push monthlyhumidity
end
max = anualmaxdata[0]["maxtemp"]
min = anualmindata[0]["mintemp"]
humid = anualhumidday[0]["humidity"]
maxindex = 0
minindex = 0
humindex = 0

anualmaxdata.each_with_index do |data, i|
  if data["maxtemp"] >= max
    max = data["maxtemp"]
    maxindex = i
  end
end

anualmindata.each_with_index do |data, i|
  if data["mintemp"] <= min
    min = data["mintemp"]
    minindex = i
  end
end

anualhumidday.each_with_index do |data, i|
  if data["humidity"] >= humid
    humid = data["humidity"]
    humindex = i
  end
end


puts "Highest: #{anualmaxdata[maxindex]["maxtemp"]}C"
puts "Lowest: #{anualmindata[minindex]["mintemp"]}C"
puts "Humid:#{anualhumidday[humindex]["humidity"]}%"

end

def avgtemp()
  find_avg_of_day()
end



highest_temp()
avgtemp()

