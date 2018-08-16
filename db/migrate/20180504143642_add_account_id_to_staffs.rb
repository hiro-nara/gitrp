class AddAccountIdToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :account_id, :integer
  end
end
