class Crew < ActiveRecord::Base
	# Attributes:
	# color:string
	# day:string
	
	has_many :students, dependent: :destroy
	has_one :crew_head, dependent: :destroy
	Color_Hash = { 'purple' => ['red', 'blue', 'recess', 'setup'], 'orange' => ['red', 'yellow', 'recess', 'setup'], 'green' => ['yellow', 'blue', 'recess', 'setup'] }

	def new
	end

	def self.current
		# return the current crews as a ActiveRecord query
		#Crew.where(color: Color_Hash[Week.current.color], day: Time.now.strftime("%A").downcase)
		curweek = Week.current
		crew_map = Hash.new
		[ :lunch1, :lunch2, :setup, :recess ].each.with_index do |item, i|
			crew_map[item] = Crew.find_by(color: Color_Hash[curweek.color][i])
		end
		return crew_map
	end
end
