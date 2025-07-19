class DropItemNameFromSalesRecords < ActiveRecord::Migration[7.0]
  def change
    remove_column :sales_records, :item_name, :string
  end
end
