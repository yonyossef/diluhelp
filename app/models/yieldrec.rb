class Yieldrec < ApplicationRecord
    validates :cultivar, presence: true;
    validates :recommended_kg, presence: true, numericality: { only_integer: true };
    belongs_to :cultivar
end
