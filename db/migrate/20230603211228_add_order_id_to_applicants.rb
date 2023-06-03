class AddOrderIdToApplicants < ActiveRecord::Migration[7.0]
  def change
    add_column :applicants, :order_id, :string
  end
end
