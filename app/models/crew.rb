class Crew < ActiveRecord::Base
	# Attributes:
	# color:string
	# day:string
	# crew_head:string
	
	has_many :students, dependent: :destroy
	validates :color, :presence => true
	validates :day, :presence => true

	Color_Hash = { 'purple' => [:red, :blue], 'orange' => [:red, :yellow], 'green' => [:yellow, :blue], 'rainbow' => [:red, :yellow, :blue] }

	def new
	end

	def self.current
		# return the current crews as a ActiveRecord query
		curweek = Week.current
		if curweek
			return Crew.by_day_and_color(Time.now.strftime("%A").downcase, curweek.color)
		else
			return nil
		end
	end

	def self.by_date(year, month, day)
		curweek = Week.by_date(year, month, day)
		if curweek
			return Crew.by_day_and_color(Time.mktime(year, month, day).strftime("%A").downcase, curweek.color)
		else
			return nil
		end
	end

	def self.by_day_and_color(day, color)
		crew_map = Hash.new
		[ :recess, :setup ].each.with_index do |item, i|
			crew_map[item] = Crew.find_by(day: day, color: item.to_s)
		end
		Color_Hash[color].each.with_index do |col, i|
			crew_map[:"lunch#{i}"] = Crew.find_by(day: day, color: col.to_s)
		end
		crew_map
	end

	def color_enum
		['red', 'blue', 'yellow', 'setup', 'recess']
	end

	def day_enum
		['monday', 'tuesday', 'wednesday', 'thursday', 'friday']
	end

end
