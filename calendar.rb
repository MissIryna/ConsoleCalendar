class Calendar
	attr_reader :date
	
	def initialize(date)
		@date = date
	end
	
	def initial_offset
		date.wday == 0 ?  6 :  date.wday-1
	end
	def month_length
		Date.new(date.year, date.month, -1).day
	end
	def today_mday 
		is_today = (date.year == Date.today.year && date.month == Date.today.month)
		today_mday = is_today ? Date.today.mday : nil
		
		today_mday
	end
end