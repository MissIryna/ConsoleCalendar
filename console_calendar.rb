require 'date'
require './printer'
require './calendar'

year = Date.today.year
month = Date.today.month

if  ARGV.length > 0
	if (1..12).include?(ARGV[0].to_i)
		month = ARGV[0].to_i
	else
		puts " #{ARGV[0]} is incorrect month!"
		exit
	end	
	if ARGV[1]
		year = ARGV[1].to_i
	end
end	

date = Date.new(year,month)
calendar = Calendar.new(date)
Printer.new(calendar).print
