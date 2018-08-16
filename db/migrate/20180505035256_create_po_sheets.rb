class CreatePoSheets < ActiveRecord::Migration[5.2]
  def change
    create_table :po_sheets do |t|
      t.string :status
      t.integer :season_index
      t.string :type
      t.integer :year
      t.string :period
      t.string :tokyu
      t.integer :grade
      t.integer :grade_c
      t.text :grade_reason
      t.string :position
      t.string :department
      t.string :department_c
      t.text :notices
      t.integer :sales_plan
      t.integer :profit_plan
      t.integer :sales_result
      t.integer :profit_result
      t.integer :total_point
      t.string :zone_primary
      t.string :zone_secondary
      t.integer :author_id
      t.integer :primary_evaluator_id
      t.integer :secondary_evaluator_id
      t.integer :objective_id

      t.timestamps
    end
  end
end
