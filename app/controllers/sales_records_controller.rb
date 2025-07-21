class SalesRecordsController < ApplicationController
  before_action :set_sales_record, only: %i[ show edit update destroy ]

  # GET /sales_records or /sales_records.json
  def index
    @limit = Setting.first.entity_limit
    offset = params[:offset].to_i || 0
    @sales_records = SalesRecord.all.limit(@limit).offset(offset).order(id: :desc)
    @total_records = SalesRecord.all.count

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /sales_records/1 or /sales_records/1.json
  def show
  end

  # GET /sales_records/new
  def new
    @sales_record = SalesRecord.new
  end

  # GET /sales_records/1/edit
  def edit
  end

  # POST /sales_records or /sales_records.json
  def create
    @sales_record = SalesRecord.new(sales_record_params)

    if @sales_record.save
      redirect_to sales_records_path, success: 'Sales Record was created'
    else
      flash.now[:danger] = @sales_record.errors.full_messages.first
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sales_records/1 or /sales_records/1.json
  def update
    
    if params[:sales_record][:sell_date].present?
      params[:sales_record][:sell_date] = Date.strptime(params[:sales_record][:sell_date], '%m/%d/%Y')
    end
    
    if @sales_record.update(sales_record_params)
      redirect_to sales_records_path, success: 'Sales Record was updated'
    else
      flash.now[:danger] = @sales_record.errors.full_messages.first
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /sales_records/1 or /sales_records/1.json
  def destroy
    @sales_record.destroy
    respond_to do |format|
      format.html { redirect_to sales_people_path, success: 'Sales Record was deleted' }
      format.json { head :no_content }
    end
  end

  def create_multiple_sales_records
    records = params[:sales_records].values

    records.each do |record|
      SalesRecord.create!(
        sales_person_id: record[:sales_person_id].to_i,
        sell_date: Date.strptime(record[:sell_date], '%m/%d/%Y'),
        item_id: record[:item_id].to_i,
        item_price: record[:item_price]
      )
    end

    redirect_to sales_records_path, success: "Sales records were created"
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sales_record
    @sales_record = SalesRecord.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sales_record_params
    params.require(:sales_record).permit(:item_name, :item_price, :sell_date, :sales_person_id)
  end
end
