class YieldrecsController < ApplicationController
  before_action :set_yieldrec, only: [:show, :edit, :update, :destroy]

  # GET /yieldrecs
  # GET /yieldrecs.json
  def index
    @yieldrecs = Yieldrec.all
  end

  # GET /yieldrecs/1
  # GET /yieldrecs/1.json
  def show
  end

  # GET /yieldrecs/new
  def new
    @yieldrec = Yieldrec.new
  end

  # GET /yieldrecs/1/edit
  def edit
  end

  # POST /yieldrecs
  # POST /yieldrecs.json
  def create
    @yieldrec = Yieldrec.new(yieldrec_params)

    respond_to do |format|
      if @yieldrec.save
        format.html { redirect_to yieldrecs_url, notice: 'Yieldrec was successfully created.' }
        format.json { render :index, status: :created, location: @yieldrec }
      else
        format.html { render :new }
        format.json { render json: @yieldrec.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yieldrecs/1
  # PATCH/PUT /yieldrecs/1.json
  def update
    respond_to do |format|
      if @yieldrec.update(yieldrec_params)
        format.html { redirect_to yieldrecs_url, notice: 'Yieldrec was successfully updated.' }
        format.json { render :index, status: :ok, location: @yieldrec }
      else
        format.html { render :edit }
        format.json { render json: @yieldrec.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yieldrecs/1
  # DELETE /yieldrecs/1.json
  def destroy
    @yieldrec.destroy
    respond_to do |format|
      format.html { redirect_to yieldrecs_url, notice: 'Yieldrec was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yieldrec
      @yieldrec = Yieldrec.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yieldrec_params
      params.require(:yieldrec).permit(:plot_strength, :recommended_kg, :cultivar_id)
    end
end
