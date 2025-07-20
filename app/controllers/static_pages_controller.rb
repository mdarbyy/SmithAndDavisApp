class StaticPagesController < ApplicationController
  def dashboard
    if params[:start_date].blank? || params[:end_date].blank?
      return
    end
    
    @start_date = Date.strptime(params[:start_date], '%m/%d/%Y')
    @end_date = Date.strptime(params[:end_date], '%m/%d/%Y')

    @sales_records = SalesRecord.where(sell_date: @start_date..@end_date)

    sales_person_ids = @sales_records.pluck(:sales_person_id).uniq
    sales_item_ids = @sales_records.pluck(:item_id).uniq
    @sales_people = SalesPerson.where(id: sales_person_ids)
    @items = Item.where(id: sales_item_ids)
  end
end
