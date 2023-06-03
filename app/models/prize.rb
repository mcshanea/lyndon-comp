class Prize < ApplicationRecord
  belongs_to :competition

  def pick_winner
    applicants = Applicant.where( :competition_id => self.id )
    winner = applicants.sample
    update(winner_id: winner.id) # Assuming the winner_id column exists in the Prize model
    winner
  end
end
