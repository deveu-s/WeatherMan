def find_max_min_of_day(file_path, year)
  file = File.open(file_path)

  filedata = []

  file.each_line do |line|
    data = line.split(",")
    next unless data[0].match(/#{year}/)

    linehash = { "date" => data[0], "maxtemp" => data[1].to_i, "mintemp" => data[3].to_i, "humidity" => data[7].to_i }
    filedata.push(linehash)
  end

  max = filedata[0]["maxtemp"]
  min = filedata[0]["mintemp"]
  hum = filedata[0]["humidity"]

  maxindex = 0
  minindex = 0
  humindex = 0

  filedata.each_with_index do |data, i|
    if data["maxtemp"] >= max
      max = data["maxtemp"]
      maxindex = i
    end

    if data["mintemp"] <= min
      min = data["mintemp"]
      minindex = i
    end

    if data["humidity"] >= hum
      hum = data["humidity"]
      humindex = i
    end
  end
  [filedata[maxindex], filedata[minindex], filedata[humindex]]
end
