class Week < ActiveRecord::Base
	# Attributes:
	# color:string
	# start_day:date
	belongs_to :week_type

	def new
	end

end
