class RenameSalesPeopleIdToSalesPersonIdInSalesRecords < ActiveRecord::Migration[7.0]
  def change
    rename_column :sales_records, :sales_people_id, :sales_person_id
  end
end
