class RemoveEmploymentDateFromSalesPeople < ActiveRecord::Migration[7.0]
  def change
    remove_column :sales_people, :employment_date, :date
  end
end
