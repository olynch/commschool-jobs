class WeeksController < ApplicationController
	def new
	end

	def create
		#render plain: params[:week].inspect
		@week = Week.new(week_params)
		
		@week.save
		redirect_to new_week_path
	end

	def index
		@weeks = Week.all
	end

	private
		def week_params
			params.require(:week).permit(:color, :start_day)
		end
end
