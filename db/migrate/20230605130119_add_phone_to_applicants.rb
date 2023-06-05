class AddPhoneToApplicants < ActiveRecord::Migration[7.0]
  def change
    add_column :applicants, :phone, :string
  end
end
