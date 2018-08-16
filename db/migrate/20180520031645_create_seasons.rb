class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.integer :season_index
      t.integer :year
      t.string :period
      t.string :nen_ki
      t.string :hyouki

      t.timestamps
    end
  end
end
