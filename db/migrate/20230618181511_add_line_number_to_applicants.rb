class AddLineNumberToApplicants < ActiveRecord::Migration[7.0]
  def change
    add_column :applicants, :line_number, :integer
  end
end
