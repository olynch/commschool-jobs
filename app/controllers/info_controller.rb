class InfoController < ApplicationController
	def index
		@week = Week.current
    @crews_json = { :day => Time.now.strftime("%A").downcase, :color => @week.color }
	end

	def by_day_and_color
		if params[:color]
			@crews = Crew.by_day_and_color(params[:day], params[:color])
			@color = params[:color].capitalize
		else
			@crews = Crew.by_day_and_color(params[:day], 'rainbow')
			@color = 'Rainbow'
		end
		@day = params[:day].capitalize
		render json: { :crews => crews_to_hash(@crews) }
	end

	def crews_to_hash(crews)
		json = Hash.new
		@crews.each do |col, c|
			json[col] = { :day => c.day, :color => c.color, :crew_head => c.crew_head, :students => c.students.map{|s| s.name } }
		end
		json
	end

	def week_to_hash(week)
		{ :start_date => week.start_day.strftime("%Y-%m-%d"), :color => week.color}
	end

	def to_hash(week, crews)
		{ :crews => crews_to_hash(crews), :week => week_to_hash(week) }
	end

	def by_date
		@week = Week.by_date(params[:year], params[:month], params[:day])
		@crews = Crew.by_date(params[:year], params[:month], params[:day])
		render json: to_hash(@week, @crew)
	end
end
