class ChangePointToObjective < ActiveRecord::Migration[5.2]
  def up
    change_column :Objectives, :point, :float
  end


  def down
    change_column :Objectives, :point, :integer
  end
end
