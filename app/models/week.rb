class Week < ActiveRecord::Base
	# Attributes:
	# color:string
	# start_day:date
	belongs_to :week_type
	validates :color, :presence => true
	validates :start_day, :presence => true

	def new
	end

	def color_enum
		["rainbow", "purple", "orange", "green"]
	end

	def self.current
		# return the current week based on the time this was called
		now = Time.now
		return Week.find_by(start_day: now.midnight - ((now.wday - 1) * 60 * 60 * 24))
	end

end
