class DosesController < ApplicationController
  before_action :set_dose, only: %i[ show edit update destroy ]

  # GET /doses or /doses.json
  def index
    @doses = Dose.all
  end

  # GET /doses/1 or /doses/1.json
  def show
  end

  # GET /doses/new
  def new
    @dose = Dose.new
  end

  # GET /doses/1/edit
  def edit
  end

  # POST /doses or /doses.json
  def create
    @dose = Dose.new(dose_params)

    respond_to do |format|
      if @dose.save
        format.html { redirect_to @dose, notice: "Dose was successfully created." }
        format.json { render :show, status: :created, location: @dose }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dose.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doses/1 or /doses/1.json
  def update
    respond_to do |format|
      if @dose.update(dose_params)
        format.html { redirect_to @dose, notice: "Dose was successfully updated." }
        format.json { render :show, status: :ok, location: @dose }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dose.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doses/1 or /doses/1.json
  def destroy
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to doses_url, notice: "Dose was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dose
      @dose = Dose.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dose_params
      params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
    end
end
