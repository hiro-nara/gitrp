class AddTokyuToStaff < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :tokyu, :string
    add_column :staffs, :grade, :string
  end
end
