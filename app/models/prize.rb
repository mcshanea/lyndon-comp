class Prize < ApplicationRecord
  belongs_to :competition

  def pick_winner
    applicants = Applicant.where( :competition_id => self.competition_id )
    winner = applicants.where(won: nil).sample
    winner.update_attribute(:won, true)
    update(winner_id: winner.id) # Assuming the winner_id column exists in the Prize model
    winner.save
    winner
  end
end
