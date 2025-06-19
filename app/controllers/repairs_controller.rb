class RepairsController < ApplicationController
  before_action :set_repair, only: %i[ show edit update destroy ]

  # GET /repairs or /repairs.json
  def index
    authorize Repair
    @repairs = Repair.all
  end

  # GET /repairs/1 or /repairs/1.json
  def show
  end

  # GET /repairs/new
  def new
    @repair = Repair.new
    @items = Item.all
    @employees = Employee.all
    @customers = Customer.all
  end

  # GET /repairs/1/edit
  def edit
    @items = Item.all
    @employees = Employee.all
    @customers = Customer.all
  end

  # POST /repairs or /repairs.json
  def create
    @repair = Repair.new(repair_params)

    respond_to do |format|
      if @repair.save
        format.html { redirect_to @repair, notice: "Repair was successfully created." }
        format.json { render :show, status: :created, location: @repair }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @repair.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repairs/1 or /repairs/1.json
  def update
    respond_to do |format|
      if @repair.update(repair_params)
        format.html { redirect_to @repair, notice: "Repair was successfully updated." }
        format.json { render :show, status: :ok, location: @repair }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @repair.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repairs/1 or /repairs/1.json
  def destroy
    @repair.destroy!

    respond_to do |format|
      format.html { redirect_to repairs_path, status: :see_other, notice: "Repair was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repair
      @repair = Repair.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def repair_params
      params.expect(repair: [ :item_id, :customer_id, :repair_date, :description, :price, :payment_status ])
    end
end
