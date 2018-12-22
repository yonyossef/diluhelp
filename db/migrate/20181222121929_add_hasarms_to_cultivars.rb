class AddHasarmsToCultivars < ActiveRecord::Migration[5.0]
  def change
    add_column :cultivars, :has_arms, :boolean, default: false
  end
end
