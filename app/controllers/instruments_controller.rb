class InstrumentsController < ApplicationController
  before_action :set_instrument, only: %i[ show edit update destroy ]

  # GET /instruments or /instruments.json
  def index
    if params[:category_id].present?
      @instruments = Instrument.where(category_id: params[:category_id])
    else
      @instruments = Instrument.all
    end
    
  end

  # GET /instruments/1 or /instruments/1.json
  def show
    authorize Instrument
  end

  # GET /instruments/new
  def new
    @instrument = Instrument.new
    @categories = Category.all
    authorize Instrument
  end

  # GET /instruments/1/edit
  def edit
    @categories = Category.all
    authorize Instrument
  end

  # POST /instruments or /instruments.json
  def create
    @instrument = Instrument.new(instrument_params)
    authorize Instrument

    respond_to do |format|
      if @instrument.save
        format.html { redirect_to @instrument, notice: "Instrument was successfully created." }
        format.json { render :show, status: :created, location: @instrument }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instruments/1 or /instruments/1.json
  def update
    authorize Instrument
    respond_to do |format|
      if @instrument.update(instrument_params)
        format.html { redirect_to @instrument, notice: "Instrument was successfully updated." }
        format.json { render :show, status: :ok, location: @instrument }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instruments/1 or /instruments/1.json
  def destroy
    authorize Instrument
    @instrument.destroy!

    respond_to do |format|
      format.html { redirect_to instruments_path, status: :see_other, notice: "Instrument was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instrument
      @instrument = Instrument.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def instrument_params
      params.expect(instrument: [ :instrument_name, :category_id ])
    end
end
