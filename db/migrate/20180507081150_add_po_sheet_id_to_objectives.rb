class AddPoSheetIdToObjectives < ActiveRecord::Migration[5.2]
  def change
    add_column :objectives, :po_sheet_id, :integer
  end
end
