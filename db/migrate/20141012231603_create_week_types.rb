class CreateWeekTypes < ActiveRecord::Migration
  def change
    create_table :week_types do |t|
      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday

      t.timestamps
    end
  end
end
