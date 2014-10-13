class AddWeekTypeToWeek < ActiveRecord::Migration
  def change
	  add_reference :weeks, :week_type, index: true
  end
end
