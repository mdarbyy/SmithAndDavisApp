class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    #@limit = Setting.first.entity_limit
    #offset = params[:offset].to_i || 0
    #@items = Item.all.includes(:sales_records).limit(@limit).offset(offset).order(name: :asc)
    #@total_records = Item.all.count

    @items = Item.all.includes(:sales_records).order(name: :asc)

    respond_to do |format|
      format.html
      format.js
    end

  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path, success: 'Item was created'
    else
      flash.now[:danger] = @item.errors.full_messages.first
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    if @item.update(item_params)
      redirect_to items_path, success: 'Item was updated'
    else
      flash.now[:danger] = @item.errors.full_messages.first
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_path, success: 'Item was deleted' }
      format.json do
        @item.destroyed? ? head(:no_content) :
        render(json: { errors: @item.errors.full_messages }, status: :unprocessable_entity)
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name)
    end
end
