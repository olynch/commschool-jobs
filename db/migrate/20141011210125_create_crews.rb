class CreateCrews < ActiveRecord::Migration
  def change
    create_table :crews do |t|
      t.string :color
      t.string :day

      t.timestamps
    end
  end
end
