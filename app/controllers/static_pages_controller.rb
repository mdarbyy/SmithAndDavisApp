class StaticPagesController < ApplicationController
  def dashboard
    @start_date = params[:start_date]
    @end_date = params[:end_date]

    if @start_date.blank? || @end_date.blank?
      return
    end

    @sales_records = SalesRecord.where(sell_date: @start_date..@end_date)

    sales_person_ids = @sales_records.pluck(:sales_person_id).uniq
    sales_item_ids = @sales_records.pluck(:item_id).uniq
    @sales_people = SalesPerson.where(id: sales_person_ids)
    @items = Item.where(id: sales_item_ids)
  end
end
