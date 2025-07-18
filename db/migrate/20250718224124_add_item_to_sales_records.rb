class AddItemToSalesRecords < ActiveRecord::Migration[7.0]
  def change
    add_reference :sales_records, :item, null: false, foreign_key: true
  end
end
