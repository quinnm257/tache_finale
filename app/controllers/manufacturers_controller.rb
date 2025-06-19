class ManufacturersController < ApplicationController
  before_action :set_manufacturer, only: %i[ show edit update destroy ]

  # GET /manufacturers or /manufacturers.json
  def index
    @manufacturers = Manufacturer.all
  end

  # GET /manufacturers/1 or /manufacturers/1.json
  def show
    authorize Manufacturer
  end

  # GET /manufacturers/new
  def new
    authorize Manufacturer
    @manufacturer = Manufacturer.new
    @countries = Country.all
  end

  # GET /manufacturers/1/edit
  def edit
    authorize Manufacturer
    @countries = Country.all
  end

  # POST /manufacturers or /manufacturers.json
  def create
    authorize Manufacturer
    @manufacturer = Manufacturer.new(manufacturer_params)

    respond_to do |format|
      if @manufacturer.save
        format.html { redirect_to @manufacturer, notice: "Manufacturer was successfully created." }
        format.json { render :show, status: :created, location: @manufacturer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manufacturers/1 or /manufacturers/1.json
  def update
    authorize Manufacturer
    respond_to do |format|
      if @manufacturer.update(manufacturer_params)
        format.html { redirect_to @manufacturer, notice: "Manufacturer was successfully updated." }
        format.json { render :show, status: :ok, location: @manufacturer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manufacturers/1 or /manufacturers/1.json
  def destroy
    authorize Manufacturer
    @manufacturer.destroy!

    respond_to do |format|
      format.html { redirect_to manufacturers_path, status: :see_other, notice: "Manufacturer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manufacturer
      @manufacturer = Manufacturer.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def manufacturer_params
      params.expect(manufacturer: [ :manufacturer_name, :country_id, :email ])
    end
end
