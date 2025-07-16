class CreateSalesRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :sales_records do |t|
      t.string :item_name
      t.decimal :item_price
      t.date :sell_date
      t.references :sales_people, null: false, foreign_key: true

      t.timestamps
    end
  end
end
