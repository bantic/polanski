class Vote < ActiveRecord::Base
  after_create :increment_vote_count
  
  private
  def increment_vote_count
    if self.positive
      VoteCount.roman_polanski.increment!(:positive)
    else
      VoteCount.roman_polanski.increment!(:negative)
    end
  end
end
