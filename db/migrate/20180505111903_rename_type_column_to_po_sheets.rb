class RenameTypeColumnToPoSheets < ActiveRecord::Migration[5.2]
  def change
    rename_column :po_sheets, :type, :sheet_type
  end
end
