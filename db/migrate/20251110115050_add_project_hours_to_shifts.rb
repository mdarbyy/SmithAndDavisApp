class AddProjectHoursToShifts < ActiveRecord::Migration[7.0]
  def change
    add_column :shifts, :project_hours, :decimal, precision: 7, scale: 2, default: 0
  end
end
