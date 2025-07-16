class ChangeItemPriceToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :sales_records, :item_price, :integer
  end
end
