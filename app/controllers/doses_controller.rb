class DosesController < ApplicationController
  before_action :set_dose, only: %i[ show edit update destroy ]

  # GET /doses/new
  def new
    # we need @cocktail in our `simple_form_for`
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  # POST /doses or /doses.json
  def create
    @dose = Dose.new(dose_params)
    # params[:cocktail_id] = params[:dose][:cocktail_id]
    # puts params
    unless params[:cocktail_id]
      params[:cocktail_id] = params[:dose][:cocktail_id]
    end

     # we need `cocktail_id` to associate dose with corresponding cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])

    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
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
