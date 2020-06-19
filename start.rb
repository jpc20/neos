require_relative 'near_earth_objects'

puts "________________________________________________________________________________________________________________________________"
puts "Welcome to NEO. Here you will find information about how many meteors, astroids, comets pass by the earth every day. \nEnter a date below to get a list of the objects that have passed by the earth on that day."
puts "Please enter a date in the following format YYYY-MM-DD."
print ">>"

date = gets.chomp
astroid_details = NearEarthObjects.find_neos_by_date(date)
astroid_list = astroid_details.details[:astroid_list]
total_number_of_astroids = astroid_details.details[:total_number_of_astroids]
largest_astroid = astroid_details.details[:biggest_astroid]



header = "| #{ column_data.map { |_,col| col[:label].ljust(col[:width]) }.join(' | ') } |"

def format_row_data(row_data, column_info)
  row = row_data.keys.map { |key| row_data[key].ljust(column_info[key][:width]) }.join(' | ')
  puts "| #{row} |"
end

def create_rows(astroid_data, column_info)
  astroid_data.each { |astroid| format_row_data(astroid, column_info) }
end

formated_date = DateTime.parse(date).strftime("%A %b %d, %Y")
puts "______________________________________________________________________________"
puts "On #{formated_date}, there were #{total_number_of_astroids} objects that almost collided with the earth."
puts "The largest of these was #{largest_astroid} ft. in diameter."
puts "\nHere is a list of objects with details:"
puts divider
puts header
create_rows(astroid_list, column_data)
puts divider
