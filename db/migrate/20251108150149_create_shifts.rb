class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.references :sales_person, null: false, foreign_key: true
      t.date :shift_date
      t.integer :sales_floor_hours, default: 1

      t.timestamps
    end
  end
end