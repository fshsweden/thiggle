module DashboardHelper
	def time_or_date(date)
  		date.today? ? date.strftime('Today at %l:%M %p') : date.strftime('%b %d')
	end

	def to_date(date)
		date.strftime('%-m/%d/%y')
	end

end
