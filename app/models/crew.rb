class Crew < ActiveRecord::Base
	# Attributes:
	# color:string
	# day:string
	# crew_head:string
	
	has_many :students, dependent: :destroy
	validates :color, :presence => true
	validates :day, :presence => true

	Color_Hash = { 'purple' => ['red', 'blue', 'recess', 'setup'], 'orange' => ['red', 'yellow', 'recess', 'setup'], 'green' => ['yellow', 'blue', 'recess', 'setup'] }

	def new
	end

	def self.current
		# return the current crews as a ActiveRecord query
		curweek = Week.current
		if curweek
			crew_map = Hash.new
			day = Time.now.strftime("%A").downcase
			[ :lunch1, :lunch2, :setup, :recess ].each.with_index do |item, i|
				crew_map[item] = Crew.find_by(day: day, color: Color_Hash[curweek.color][i])
			end
			return crew_map
		else
			return nil
		end
	end

	def color_enum
		['red', 'blue', 'yellow', 'setup', 'recess']
	end

	def day_enum
		['monday', 'tuesday', 'wednesday', 'thursday', 'friday']
	end

end
