class AddWonToApplicants < ActiveRecord::Migration[7.0]
  def change
    add_column :applicants, :won, :boolean
  end
end
