class CreateCrewHeads < ActiveRecord::Migration
  def change
    create_table :crew_heads do |t|
      t.string :name
	  t.belongs_to :crew

	  t.timestamps
    end
  end
end
