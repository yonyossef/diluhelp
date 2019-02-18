class Yieldrec < ApplicationRecord
    validates :cultivar, presence: true;
    validates :young_plot, presence: true, numericality: { only_integer: true };
    validates :regular_plot, presence: true, numericality: { only_integer: true };
    validates :weak_plot, presence: true, numericality: { only_integer: true };
    belongs_to :cultivar
    has_many :plots, dependent: :destroy
    
    attr_accessor :young_plot
    attr_accessor :regular_plot
    attr_accessor :weak_plot
end
