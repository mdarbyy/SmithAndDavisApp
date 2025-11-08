class ShiftsController < ApplicationController
  before_action :set_shift, only: %i[ show edit update destroy ]

  # GET /shifts or /shifts.json
  def index
    @limit = Setting.first.entity_limit
    offset = params[:offset].to_i || 0
    @shifts = Shift.all.limit(@limit)
    .offset(offset)
    .order(id: :desc)
    @total_records = Shift.all.count

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /shifts/1 or /shifts/1.json
  def show
  end

  # GET /shifts/new
  def new
    @shift = Shift.new
  end

  # GET /shifts/1/edit
  def edit
  end

  # POST /shifts or /shifts.json
  def create
    
    @shift = Shift.new(
      sales_person_id: shift_params[:sales_person_id].to_i,
      shift_date: Date.strptime(shift_params[:shift_date], '%m/%d/%Y'),
      sales_floor_hours: shift_params[:sales_floor_hours].to_f
    )

    if @shift.save
      redirect_to shifts_path, success: 'Shift was created'
    else
      flash.now[:danger] = @shift.errors.full_messages.first
      render :new, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /shifts/1 or /shifts/1.json
  def update
    if params[:shift][:shift_date].present?
      params[:shift][:shift_date] = Date.strptime(params[:shift][:shift_date], '%m/%d/%Y')
    end
    
    if @shift.update(shift_params)
      redirect_to shifts_path, success: 'Shift was updated'
    else
      flash.now[:danger] = @shift.errors.full_messages.first
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /shifts/1 or /shifts/1.json
  def destroy
    @shift.destroy
    respond_to do |format|
      format.html { redirect_to shifts_path, success: 'Shift was deleted' }
      format.json do
        @shift.destroyed? ? head(:no_content) :
        render(json: { errors: @shift.errors.full_messages }, status: :unprocessable_entity)
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shift_params
      params.require(:shift).permit(:sales_person_id, :shift_date, :sales_floor_hours)
    end
end
