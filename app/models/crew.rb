class Crew < ActiveRecord::Base
	# Attributes:
	# color:string
	# day:string
	
	has_many :students, dependent: :destroy
	has_one :crew_head, dependent: :destroy
	Color_Hash = { 'purple' => ['red', 'blue'], 'orange' => ['red', 'yellow'], 'green' => ['yellow', 'blue'] }

	def new
	end

	def self.current
		# return the current crews as a ActiveRecord query
		Crew.where(color: Color_Hash[Week.current.color], day: Time.now.strftime("%A").downcase)
	end
end
