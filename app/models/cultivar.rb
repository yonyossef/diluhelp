class Cultivar < ApplicationRecord
  belongs_to :species
  has_many :yieldrecs
end
