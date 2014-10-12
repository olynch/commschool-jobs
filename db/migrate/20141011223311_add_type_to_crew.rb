class AddTypeToCrew < ActiveRecord::Migration
  def change
    add_column :crews, :type, :string
  end
end
