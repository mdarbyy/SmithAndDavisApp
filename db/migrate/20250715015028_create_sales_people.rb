class CreateSalesPeople < ActiveRecord::Migration[7.0]
  def change
    create_table :sales_people do |t|
      t.string :first_name
      t.string :last_name
      t.date :employment_date

      t.timestamps
    end
  end
end
