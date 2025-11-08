class ChangeSalesFloorHoursToDecimalInShifts < ActiveRecord::Migration[7.0]
  def change
    change_column :shifts, :sales_floor_hours, :decimal, precision: 7, scale: 2
  end
end
