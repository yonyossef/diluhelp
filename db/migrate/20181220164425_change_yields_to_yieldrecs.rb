class ChangeYieldsToYieldrecs < ActiveRecord::Migration[5.0]
  def change
    rename_table :yields, :yieldrecs
  end
end
