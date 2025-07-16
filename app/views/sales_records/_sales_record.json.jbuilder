json.extract! sales_record, :id, :item_name, :item_price, :sell_date, :SalesPerson_id, :created_at, :updated_at
json.url sales_record_url(sales_record, format: :json)
