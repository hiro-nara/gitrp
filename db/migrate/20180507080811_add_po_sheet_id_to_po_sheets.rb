class AddPoSheetIdToPoSheets < ActiveRecord::Migration[5.2]
  def change
    add_column :po_sheets, :po_sheet_id, :integer
  end
end
