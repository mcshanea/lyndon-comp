class CreateApplicants < ActiveRecord::Migration[7.0]
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :email
      t.string :ticket_reference
      t.integer :answer
      t.date :entry_date
      t.references :competition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
