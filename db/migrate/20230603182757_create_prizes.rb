class CreatePrizes < ActiveRecord::Migration[7.0]
  def change
    create_table :prizes do |t|
      t.string :name
      t.float :value
      t.integer :winner_id
      t.references :competition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
