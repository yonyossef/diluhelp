class Cultivar < ApplicationRecord
  belongs_to :species
  has_many :yieldrecs, dependent: :destroy
end
