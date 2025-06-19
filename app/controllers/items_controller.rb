class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    if params[:instrument_id].present?
      @items = Item.where(instrument_id: params[:instrument_id])
    elsif params[:manufacturer_id].present?
      @items = Item.where(manufacturer_id: params[:manufacturer_id])
    else
      @items = Item.all
    end
  end

  # GET /items/1 or /items/1.json
  def show
    authorize Item
  end

  # GET /items/new
  def new
    authorize Item
    @item = Item.new
    @instruments = Instrument.all
    @manufacturers = Manufacturer.all
  end

  # GET /items/1/edit
  def edit
    authorize Item
    @instruments = Instrument.all
    @manufacturers = Manufacturer.all
  end

  # POST /items or /items.json
  def create
    authorize Item
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    authorize Item
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    authorize Item
    @item.destroy!

    respond_to do |format|
      format.html { redirect_to items_path, status: :see_other, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.expect(item: [ :instrument_id, :model, :manufacturer_id, :serial_number, :description, :condition, :production_year, :price, :image ])
    end
end
