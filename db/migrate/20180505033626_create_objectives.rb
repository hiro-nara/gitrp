class CreateObjectives < ActiveRecord::Migration[5.2]
  def change
    create_table :objectives do |t|
      t.string :titel
      t.text :content
      t.text :criteria_1
      t.text :criteria_2
      t.text :criteria_3
      t.text :criteria_4
      t.string :difficulty
      t.integer :weight
      t.text :consequence
      t.text :consequence_evaluator
      t.string :self_evaluation
      t.string :primary_evaluation
      t.string :secondary_evaluation
      t.integer :point

      t.timestamps
    end
  end
end
