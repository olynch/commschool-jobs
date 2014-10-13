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

	def show
		@week = Week.find(params[:id])
	end

	def edit
		@week = Week.find(params[:id])
	end

	def update
		@week = Week.find(params[:id])
		@week.update(week_params)
		redirect_to weeks_path
	end

	def destroy
		@week = Week.find(params[:id])

		@week.destroy
		redirect_to weeks_path
	end

	private
		def week_params
			params.require(:week).permit(:color, :start_day)
		end
end
