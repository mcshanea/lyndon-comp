require 'csv'

class Applicant < ApplicationRecord
  belongs_to :competition

  attr_accessor :quantity, :product_id

  def self.import(file)
    check_for_multiple = []
    competition = Competition.first

    CSV.foreach(file.path, headers: true, :header_converters => lambda { |h| h.downcase.gsub(' ', '_') }) do |row|
      if row["product_id"] != "12283"
        next
      end

      if row["answer"] != "74" && row["answer"] != "70"
        if row["answer"].blank?
          check_for_multiple << row
        end

        next
      end

      # filter any answers after we got rid of 70 from site
      if row["answer"] == "70" && Date.parse(row["entry_date"]) < Date.parse('2023-04-10') == false
        next
      end

      row["competition_id"] = competition.id

      if row["answer"].blank?
        check_for_multiple << row
        next
      end

      row["quantity"].to_i.times {
        applicant = Applicant.create!(row.to_h)
        applicant.save
      }
    end

    check_for_multiple.each do |row|
      applicant = Applicant.find_by_email( row["email"] )

      # to exist in the DB they must have entered a right answer
      if applicant.nil? == false
        row["competition_id"] = competition.id
        Applicant.create!(row.to_h)
      end
    end
  end
end
