class YieldrecsController < ApplicationController
  before_action :set_yieldrec, only: [:show, :edit, :update, :destroy]

  # GET /yieldrecs
  # GET /yieldrecs.json
  def index
    @yieldrecs = Yieldrec.joins(:cultivar).order('cultivars.name asc')
  end

  # GET /yieldrecs/1
  # GET /yieldrecs/1.json
  def show
  end

  # GET /yieldrecs/new
  def new
    @yieldrec = Yieldrec.new
    @yieldrec.young_plot = 0
    @yieldrec.regular_plot = 0
    @yieldrec.weak_plot = 0
  end

  # GET /yieldrecs/1/edit
  def edit
  end

  # POST /yieldrecs
  # POST /yieldrecs.json
  def create
    array = [{:a => :young_plot, :name => "צעירה"}, {:a => :regular_plot, :name => "רגילה"}, {:a => :weak_plot, :name => "חלשה"}]
    
    array.each do |attribute|
      @yieldrec = Yieldrec.new(yieldrec_params)
      @yieldrec.recommended_kg = yieldrec_params[attribute[:a]]
      @yieldrec.plot_strength = attribute[:name]
      
      puts @yieldrec.recommended_kg
      if @yieldrec.save
        puts "Successful save"
      else
        respond_to do |format|
          format.html { render :new }
          format.json { render json: @yieldrec.errors, status: :unprocessable_entity }
        end
      end
    end
    respond_to do |format|
      format.html { redirect_to yieldrecs_url, notice: 'המלצת היבול נוספה בהצלחה למסד הנתונים' }
      format.json { render :index, status: :created, location: @yieldrec }
    end
  end

  # PATCH/PUT /yieldrecs/1
  # PATCH/PUT /yieldrecs/1.json
  def update
    respond_to do |format|
      if @yieldrec.update(yieldrec_params)
        format.html { redirect_to yieldrecs_url, notice: 'המלצת היבול עודכנה בהצלחה במסד הנתונים' }
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
      format.html { redirect_to yieldrecs_url, notice: 'המלצת היבול נמחקה בהצלחה' }
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
      params.require(:yieldrec).permit(:plot_strength, :young_plot, :regular_plot, :weak_plot, :cultivar_id)
    end
end
