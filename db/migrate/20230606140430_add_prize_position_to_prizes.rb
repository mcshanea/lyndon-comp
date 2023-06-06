class AddPrizePositionToPrizes < ActiveRecord::Migration[7.0]
  def change
    add_column :prizes, :prize_position, :string
  end
end
