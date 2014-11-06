class AddCrewHeadFieldToCrew < ActiveRecord::Migration
  def change
		add_column :crews, :crew_head, :string
		remove_column :crews, :type, :string
  end
end
