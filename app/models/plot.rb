class Plot < ApplicationRecord
    belongs_to :species
    belongs_to :cultivars
    belongs_to :yieldrecs
    
    validates :name, presence: true;
    validates :linedist_meters, presence: true, numericality: { greater_than: 0, less_than: 20 };
    validates :treedist_meters, presence: true, numericality: { greater_than: 0, less_than: 20 };
    
    def calc_results()
        if self.linedist_meters.nil? or self.treedist_meters.nil? 
            
        else
            fruit_weight = Cultivar.find(self.cultivar_id).fruit_weight_gr
            base_yield = Yieldrec.find(self.yieldrec_id).recommended_kg
            self.trees_per_dunam = (1000 / self.linedist_meters) / self.treedist_meters
            self.kg_per_tree = (self.yieldwish_kg + base_yield) / self.trees_per_dunam
            self.fruits_per_tree = self.kg_per_tree * 1000 / fruit_weight
            self.fruits_per_arm = (self.arms == 0 || self.arms.nil?) ? 0 : self.fruits_per_tree / self.arms 
        end
    end
end
