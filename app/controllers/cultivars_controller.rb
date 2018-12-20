class CultivarsController < ApplicationController
  before_action :set_cultivar, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  # GET /cultivars
  # GET /cultivars.json
  def index
    @cultivars = Cultivar.all
  end

  # GET /cultivars/1
  # GET /cultivars/1.json
  def show
  end

  # GET /cultivars/new
  def new
    @cultivar = Cultivar.new
  end

  # GET /cultivars/1/edit
  def edit
  end

  # POST /cultivars
  # POST /cultivars.json
  def create
    @cultivar = Cultivar.new(cultivar_params)

    respond_to do |format|
      if @cultivar.save
        format.html { redirect_to cultivars_url, notice: 'הזן נוסף בהצלחה למסד הנתונים' }
        format.json { render :index, status: :created, location: @cultivar }
      else
        format.html { render :new }
        format.json { render json: @cultivar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cultivars/1
  # PATCH/PUT /cultivars/1.json
  def update
    respond_to do |format|
      if @cultivar.update(cultivar_params)
        format.html { redirect_to cultivars_url, notice: 'הזן עודכן בהצלחה במסד הנתונים' }
        format.json { render :index, status: :ok, location: @cultivar }
      else
        format.html { render :edit }
        format.json { render json: @cultivar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cultivars/1
  # DELETE /cultivars/1.json
  def destroy
    @cultivar.destroy
    respond_to do |format|
      format.html { redirect_to cultivars_url, notice: 'הזן נמחק בהצלחה ממסד הנתונים' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cultivar
      @cultivar = Cultivar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cultivar_params
      params.require(:cultivar).permit(:name, :fruit_weight_gr, :species_id)
    end
end
