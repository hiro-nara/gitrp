class AddDep1stToPoSheet < ActiveRecord::Migration[5.2]
  def change
    add_column :po_sheets, :dep_1st, :string
    add_column :po_sheets, :dep_2st, :string
    add_column :po_sheets, :dep_3st, :string
    add_column :po_sheets, :dep_bunshitsu, :string
  end
end
