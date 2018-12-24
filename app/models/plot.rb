class Plot < ApplicationRecord
    belongs_to :species
    belongs_to :cultivars
    belongs_to :yieldrecs
end
