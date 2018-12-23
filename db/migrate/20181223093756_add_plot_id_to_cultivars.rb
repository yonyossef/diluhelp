class AddPlotIdToCultivars < ActiveRecord::Migration[5.0]
  def change
    add_reference :cultivars, :plot, foreign_key: true
  end
end
