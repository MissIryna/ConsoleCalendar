class Printer
	
	RED_COLOR_CODE = 31
	GREEN_COLOR_CODE = 32
	DAY_WIDTH = 3
	DAY_IN_WEEK = 7
	
	attr_reader :calendar
	
	def initialize(calendar)
		@calendar = calendar
	end
	
	def print
		print_header
		print_weeks		
	end	
	
	private
	
	def print_header
		puts "Mon Tue Wed Thu Fri Sat Sun"
	end
	
	def print_weeks 
		dates = [nil] * calendar.initial_offset + (1..calendar.month_length).to_a
		dates.each_slice(DAY_IN_WEEK) do |week|	
			puts week.map.with_index { |date, i| format_date(date, date == calendar.today_mday, i >= 5) }.join(' ')
		end
	end
	
	def format_date(date, is_today, is_weekend)
		padded_date = date.to_s.rjust(DAY_WIDTH)
		if is_today
			today_color(padded_date)
		elsif is_weekend
			weekend_color(padded_date)
		else			
			padded_date
		end
	end
	
	def colorize(text, color_code)
		"\e[#{color_code}m#{text}\e[0m"
	end
	def  weekend_color(text)
		colorize(text, RED_COLOR_CODE);
	end
	def today_color(text)
		colorize(text, GREEN_COLOR_CODE);
	end
end	