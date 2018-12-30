require "prawn"
require "bidi"


class PlotsController < ApplicationController
  before_action :set_plot, only: [:show, :edit, :update, :destroy]
  
  def index
  end
  
  def new
      @plot = Plot.new
  end
  
  def show
    respond_to do |format|
      format.html
      format.pdf do
        
        _filename = "PLOT_RESULTS_#{Time.current}.pdf"
        
        pdf = Prawn::Document.new
        
        pdf.font_families.update("OpenSans" => {
          :normal => "#{Rails.root}/app/assets/fonts/Open Sans Hebrew/TTF/OpenSansHebrew-Regular.ttf",
        });
        pdf.font("OpenSans")
        pdf.text_direction = :rtl
        pdf.font_size = 20
        
        bidi = Bidi.new
        
        # t.string   "name"
        # t.datetime "created_at",      null: false
        
        # t.integer  "species_id"
        # t.integer  "cultivar_id"
        
        # t.integer  "linedist_meters"
        # t.integer  "treedist_meters"
        # t.integer  "arms"
        # t.string   "strength"
        # t.integer  "yieldwish_kg"
        
        # t.integer  "trees_per_dunam"
        # t.integer  "kg_per_tree"
        # t.integer  "fruits_per_tree"
        # t.integer  "fruits_per_arm"
        
        pdf.formatted_text_box([{ 
          :text => "שם החלקה: " + "#{@plot.name}" + "\n"},{
          :text => "תאריך החישוב: " + bidi.render_visual("#{@plot.created_at}") + "\n"},{
          :text => "שם המין: " + "#{Species.find(@plot.species_id).name}" + "\n"},{
          :text => "שם הזן: " + "#{Cultivar.find(@plot.cultivar_id).name}" + "\n"},{
          :text => "חוזק החלקה: " + bidi.render_visual("#{@plot.strength}") + "\n"},{
          :text => "יבול רצוי: " + bidi.render_visual("#{@plot.yieldwish_kg}") + ' ק"ג' + "\n"},{
          :text => "מרחק בין שורות: " + bidi.render_visual("#{@plot.linedist_meters}") + ' מטר' + "\n"},{
          :text => "מרחק בין עצים: " + bidi.render_visual("#{@plot.treedist_meters}") + ' מטר' + "\n"},{
          :text => "מספר זרועות לעץ: " + bidi.render_visual("#{@plot.arms}") + "\n"},{
          :text => "מספר עצים לדונם: " + bidi.render_visual("#{@plot.trees_per_dunam}") + "\n"},{
          :text => "כמות פרי לעץ: " + bidi.render_visual("#{@plot.kg_per_tree}") + ' ק"ג' + "\n"},{
          :text => "מספר פירות לזרוע: " + bidi.render_visual("#{@plot.fruits_per_arm}") + "\n"},{
          :text => "מספר פירות לעץ: " + bidi.render_visual("#{@plot.fruits_per_tree}") + "\n"
        }]);
        
        send_data pdf.render, 
          filename: _filename,
          type: 'application/pdf',
          disposition: 'inline'        
      end
    end
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
      text client.name, align: :center
      text "fruits_per_tree: #{client.fruits_per_tree}"
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
