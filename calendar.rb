class Calendar
	attr_reader :date, :first_day_inweek
	DAYS_IN_WEEK = 7


	def initialize(date, first_day_inweek = 1)
		@date = date
		@first_day_inweek = first_day_inweek
	end

	def initial_offset
		if first_day_inweek == 0
			return date.wday
		else
			date.wday == 0 ?  DAYS_IN_WEEK - first_day_inweek :  date.wday - first_day_inweek
		end
	end

	def title
		"#{date.year} - #{Date::MONTHNAMES[date.month]}"
	end
	
	def header
		days_of_week = Date::ABBR_DAYNAMES.map{ |x| " #{x}"}
		set_first_day(days_of_week, first_day_inweek).join("")
	end

	def weekend
		saturday = 6
		sunday = 0
		if first_day_inweek == 0
			[saturday, sunday]
		else
			sunday = 7
			saturday = 6
			[saturday - first_day_inweek, sunday - first_day_inweek ]
		end
	end

	def month_length
		Date.new(date.year, date.month, -1).day
	end

	#Returns an index of today's date in the calendar's month if today is in range; nil otherwise
	def today_mday 
		is_today = (date.year == Date.today.year && date.month == Date.today.month)
		today_mday = is_today ? Date.today.mday : nil
		
		today_mday
	end
	
	private
	def set_first_day( days_of_week, first_day_inweek)
		if first_day_inweek != 0
			days_of_week.shift(first_day_inweek)
			days_of_week.push(" ")
			days_of_week.push( [0..first_day_inweek-1].map{|i| Date::ABBR_DAYNAMES[i]}.join(" "))
		end
		days_of_week
	end

	end
