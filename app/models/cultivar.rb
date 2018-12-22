class Cultivar < ApplicationRecord
  validates :species_id, presence: true;
  validates :has_arms, presence: true;
  validates :name, :length => {:within => 2..25}, :allow_blank => false;
  validates :fruit_weight_gr, presence: true, numericality: { only_integer: true };
  belongs_to :species
  has_many :yieldrecs, dependent: :destroy
end
