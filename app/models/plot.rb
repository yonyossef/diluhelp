class Plot < ApplicationRecord
    belongs_to :species
    belongs_to :cultivars
    belongs_to :yieldrecs
    
    validates :plot_linedist_meters, presence: true, numericality: { greater_than: 0, less_than: 20 };;
    validates :treedist_meters, presence: true, numericality: { greater_than: 0, less_than: 20 };;
end
