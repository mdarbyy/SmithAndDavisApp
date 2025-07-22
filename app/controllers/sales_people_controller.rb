class SalesPeopleController < ApplicationController
  before_action :set_sales_person, only: %i[ show edit update destroy ]

  # GET /sales_people or /sales_people.json
  def index
    @limit = Setting.first.entity_limit
    offset = params[:offset].to_i || 0
    @sales_people = SalesPerson.all.includes(:sales_records).limit(@limit).offset(offset).order(first_name: :asc, last_name: :asc)
    @total_records = SalesPerson.all.count

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /sales_people/1 or /sales_people/1.json
  def show
    @sales_records = @sales_person.sales_records.includes(:item).order(id: :desc)
    @total_records = SalesRecord.where(sales_person_id: @sales_person.id).count

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /sales_people/new
  def new
    @sales_person = SalesPerson.new
  end

  # GET /sales_people/1/edit
  def edit
  end

  # POST /sales_people or /sales_people.json
  def create
    @sales_person = SalesPerson.new(sales_person_params)
    if @sales_person.save
      redirect_to sales_people_path, success: 'Sales Person was created'
    else
      flash.now[:danger] = @sales_person.errors.full_messages.first
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sales_people/1 or /sales_people/1.json
  def update
    if @sales_person.update(sales_person_params)
      redirect_to sales_people_path, success: 'Sales Person was updated'
    else
      flash.now[:danger] = @sales_person.errors.full_messages.first
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /sales_people/1 or /sales_people/1.json
  def destroy
    @sales_person.destroy
    respond_to do |format|
      format.html { redirect_to sales_people_path, success: 'Sales Person was deleted' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_person
      @sales_person = SalesPerson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sales_person_params
      params.require(:sales_person).permit(:first_name, :last_name)
    end
end
