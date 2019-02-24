class PlotPdf < Prawn::Document
    def initialize(plot)
        super(top_margin: 70)
        @plot = plot
        @bidi = Bidi.new
    end
    
    def pdf_style
        self.font_families.update("OpenSans" => {
          :normal => "#{Rails.root}/app/assets/fonts/Open Sans Hebrew/TTF/OpenSansHebrew-Regular.ttf",
        });
        self.font("OpenSans")
        self.text_direction = :rtl
        self.font_size = 20
    end
    
    def plot_intro
        @base_yield = Yieldrec.find(@plot.yieldrec_id).recommended_kg
        
        # text "Intro"
        
        self.formatted_text_box([{ 
            :text => "תוצאות מחשבון דילול" + "\n"},{
            :text => "--------------------------" + "\n"},{
            :text => "שם החלקה: " + "#{@plot.name}" + "\n"},{
            :text => "תאריך החישוב: " + @bidi.render_visual("#{@plot.created_at}") + "\n"},{
            :text => "שם המין: " + "#{Species.find(@plot.species_id).name}" + "\n"},{
            :text => "שם הזן: " + "#{Cultivar.find(@plot.cultivar_id).name}" + "\n"},{
            :text => "חוזק החלקה: " + "#{Yieldrec.find(@plot.yieldrec_id).plot_strength}" + "\n"},{
            :text => "יבול רצוי: " + @bidi.render_visual("#{@plot.yieldwish_kg + @base_yield}") + ' ק"ג' + "\n"},{
            :text => "מרחק בין שורות: " + @bidi.render_visual("#{@plot.linedist_meters}") + ' מטר' + "\n"},{
            :text => "מרחק בין עצים: " + @bidi.render_visual("#{@plot.treedist_meters}") + ' מטר' + "\n"},{
            :text => "מספר זרועות לעץ: " + @bidi.render_visual("#{@plot.arms}") + "\n"},{
            :text => "מספר עצים לדונם: " + @bidi.render_visual("#{@plot.trees_per_dunam}") + "\n"},{
            :text => "כמות פרי לעץ: " + @bidi.render_visual("#{@plot.kg_per_tree}") + ' ק"ג' + "\n"},{
            :text => "מספר פירות לזרוע: " + @bidi.render_visual("#{@plot.fruits_per_arm}") + "\n"},{
            :text => "מספר פירות לעץ: " + @bidi.render_visual("#{@plot.fruits_per_tree}") + "\n"},{
            :text => "--------------------------" + "\n"},{
            :text => "אין באמור לעיל אלא בגדר עצה מקצועית בלבד ועל מקבל העצה לנהוג מנהג זהירות." + "\n"},{
            :text => "ביצוע האמור בעצה הינו על אחריותו הבלעדית של מקבל העצה." + "\n"},{
            :text => "--------------------------" + "\n"},{
            :text => "לסיוע נוסף ניתן לפנות בדואר אלקטרוני לענת זיסוביץ, מדריכת מטעים:" + "\n"},{
            :text => "moc.liamg@osiztanna" + "\n"
        }]);
    end


    def plot_data_rows
        [["Species", Species.find(@plot.species_id).name]] +
         [["Cultivar", Cultivar.find(@plot.cultivar_id).name]]
    end
    
    def plot_data
        move_down 20
        table plot_data_rows do
          row(0).font_style = :bold
          columns(0..1).align = :right
          self.row_colors = ['DDDDDD', 'FFFFFF']
          self.header = true
        end
    end
end
