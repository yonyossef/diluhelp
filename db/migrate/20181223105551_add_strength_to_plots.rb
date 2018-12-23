class AddStrengthToPlots < ActiveRecord::Migration[5.0]
  def change
    add_column :plots, :strength, :string
  end
end
