require "prawn"

class PlotsController < ApplicationController
  before_action :set_plot, only: [:show, :edit, :update, :destroy]
  
  def index
  end
  
  def new
      @plot = Plot.new
  end
  
  def show
  end
  
  def download_pdf
    plot = Plot.find(params[:id])
    send_data generate_pdf(plot),
              filename: "#{plot.name}_RESULTS_#{Time.current}.pdf",
              type: "application/pdf"
  end

  def create
    @plot = Plot.new(plot_params)
    
    @plot.calc_results
    
    respond_to do |format|
      if @plot.save
        format.html { redirect_to @plot, notice: 'נתוני החלקה נוספו בהצלחה למסד הנתונים' }
        format.json { render :show, status: :created, location: @plot }
      else
        format.html { render :new }
        format.json { render json: @plot.errors, status: :unprocessable_entity }
      end
    end
  end
  
    # PATCH/PUT /cultivars/1
  # PATCH/PUT /cultivars/1.json
  def update
      
    @plot.calc_results
    
    respond_to do |format|
      if @plot.update(plot_params)
        format.html { redirect_to @plot, notice: 'נתוני החלקה עודכנו בהצלחה במסד הנתונים' }
        format.json { render :show, status: :ok, location: @plot }
      else
        format.html { render :edit }
        format.json { render json: @plot.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def generate_pdf(client)
    Prawn::Document.new do
      text plot.name, align: :center
      text "fruits_per_tree: #{plot.fruits_per_tree}"
    end.render
  end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_plot
      @plot = Plot.find(params[:id])
    end
  
  def plot_params
    params.require(:plot).permit(:name, :species_id, :cultivar_id, :yieldrec_id, :yieldwish_kg, :arms, :linedist_meters, :treedist_meters)
  end
end
