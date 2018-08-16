class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.string :staff_no
      t.string :name
      t.string :department
      t.string :dep_1st
      t.string :dep_2nd
      t.string :dep_3rd
      t.string :dep_bunshitsu
      t.string :position
      t.string :email

      t.timestamps
    end
  end
end
