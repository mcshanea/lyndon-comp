require 'csv'

class Applicant < ApplicationRecord
  belongs_to :competition

  def self.import(file)
    check_for_multiple = []
    competition = Competition.first

    CSV.foreach(file.path, headers: true, :header_converters => lambda { |h| h.downcase.gsub(' ', '_') }) do |row|
      if Applicant.find_by_email( row["email"] ).nil? == false && row["answer"] != "74" && row["answer"] != "70"
        if row["answer"].blank?
          check_for_multiple << row
        end

        next
      end

      row["competition_id"] = competition.id

      if row["answer"].blank?
        check_for_multiple << row
        next
      end

      applicant = Applicant.create!(row.to_h)
      applicant.save
    end

    check_for_multiple.each do |row|
      applicant = Applicant.find_by_email( row["email"] )

      if applicant.nil? == false && applicant.answer == 74
        row["competition_id"] = competition.id
        Applicant.create!(row.to_h)
      end
    end
  end
end
