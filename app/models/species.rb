class Species < ApplicationRecord
    has_many :cultivars, dependent: :destroy
end
