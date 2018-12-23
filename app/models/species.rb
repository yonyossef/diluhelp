class Species < ApplicationRecord
    validates :name, :length => {:within => 2..25}, :allow_blank => false;
    has_many :cultivars, dependent: :destroy
    has_many :plots
end
