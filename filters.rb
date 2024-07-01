# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

require_relative 'candidates'
require 'date'

  def find(id)
    @candidates.find { |candidate| candidate[:id] == id }
  end
  
  def experienced?(candidate)
    candidate[:years_of_experience] >= 2
  end

  def github_points(candidate)
    candidate[:github_points] >= 100
  end

  def knows_languages(candidate)
    (candidate[:languages] & ['Ruby', 'Python']).any?
  end

  def application_date(candidate)
    candidate[:date_applied] >= (Date.today - 15)
  end

  def candidate_age(candidate)
    candidate[:age] > 17
  end
  
  def qualified_candidates(candidates)
    candidates.select do |candidate|
      experienced?(candidate) &&
      github_points(candidate) &&
      knows_languages(candidate) &&
      application_date(candidate) &&
      candidate_age(candidate)
    end
  end

  def ordered_by_qualifications
    candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
  end
  
  # More methods will go below